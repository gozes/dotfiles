#!/usr/bin/env fish

# Defaults (override via env before calling)
set -q PROXY_BIN; or set PROXY_BIN go-copilot-proxy
set -q PROXY_PORT; or set PROXY_PORT 38080
set -q PROXY_ADDR; or set PROXY_ADDR 127.0.0.1
set PROXY_URL http://$PROXY_ADDR:$PROXY_PORT

set -q LOG_DIR; or set LOG_DIR ~/.cache/go-copilot-proxy
set LOG_FILE $LOG_DIR/proxy.log
mkdir -p $LOG_DIR

# Helper: test if listening
function _port_open --argument addr port
    if command -q curl
        if curl -fsS -m 1 http://$addr:$port/health >/dev/null 2>&1
            return 0
        end
        if curl -fsS -m 1 http://$addr:$port/v1/models >/dev/null 2>&1
            return 0
        end
    end
    if command -q nc
        nc -z $addr $port >/dev/null 2>&1; and return 0
    end
    return 1
end

# Helper: wait until /v1/models responds
function _wait_ready --argument base tries
    set -q tries; or set tries 50
    for i in (seq 1 $tries)
        if command -q curl
            if curl -fsS -m 1 $base/v1/models >/dev/null 2>&1
                return 0
            end
        else
            if _port_open (string replace -r '^https?://([^:/]+).*' '$1' $base) $PROXY_PORT
                return 0
            end
        end
        sleep 0.2
    end
    echo "Proxy did not become ready on $base" 1>&2
    return 1
end

# Determine if already running (e.g., managed by systemd)
set OWNED 0
if not _port_open $PROXY_ADDR $PROXY_PORT
    # Start our own instance
    set OWNED 1

    # Export any upstream env here if needed:
    # set -x COPILOT_UPSTREAM_BASE_URL https://copilot-proxy.example.com
    # set -x COPILOT_UPSTREAM_MODEL gpt-4o-copilot
    # set -x COPILOT_BEARER ghp_xxx

    # Start in background; capture PID
    $PROXY_BIN serve --port $PROXY_PORT >>$LOG_FILE 2>&1 &
    set PROXY_PID $last_pid
    echo $PROXY_PID > $LOG_DIR/proxy.pid

    # Wait for readiness
    if not _wait_ready $PROXY_URL 50
        if test -n "$PROXY_PID"
            kill $PROXY_PID ^/dev/null
        end
        exit 1
    end
else
    # Someone else is running it; don't manage lifecycle
    set PROXY_PID ""
end

# On exit, stop child if we started it (comment this block to keep proxy running)
function _cleanup --on-process %self
    if test "$OWNED" = "1"
        if test -n "$PROXY_PID"
            kill $PROXY_PID ^/dev/null
            for i in (seq 1 10)
                if not kill -0 $PROXY_PID ^/dev/null
                    break
                end
                sleep 0.2
            end
            if kill -0 $PROXY_PID ^/dev/null
                kill -9 $PROXY_PID ^/dev/null
            end
        end
        rm -f $LOG_DIR/proxy.pid
    end
end

# Export env for Crush provider to target local proxy
set -q OPENAI_API_KEY; or set -x OPENAI_API_KEY dummy
set -q OPENAI_BASE_URL; or set -x OPENAI_BASE_URL $PROXY_URL/v1

# Exec crush with any passed args
command crush $argv
set exit_code $status
exit $exit_code
