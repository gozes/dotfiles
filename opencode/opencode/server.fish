#!/usr/bin/env fish

# Optional logging helper
function _log
    set -l msg (string join ' ' $argv)
    if type -q systemd-cat
        echo $msg | systemd-cat -t opencode-wrapper
    else
        echo $msg 1>&2
    end
end

# 1) Ensure PATH includes typical mise shims before sourcing config
set -l shim_candidates ~/.local/share/mise/shims ~/.mise/bin ~/.local/bin
set -l base_path /usr/local/bin:/usr/bin:/bin
set -l path_final $base_path
for dir in $shim_candidates
    if test -d $dir
        set path_final $dir":"$path_final
    end
end
set -gx PATH $path_final

# 2) Source your fish config to load env vars (MCP, etc.)
if test -f ~/.config/fish/config.fish
    source ~/.config/fish/config.fish
end
# Source conf.d snippets as well (belt and suspenders)
for f in ~/.config/fish/conf.d/*.fish
    if test -f $f
        source $f
    end
end

# 3) Resolve opencode from PATH (mise shim)
set -l bin (command -v opencode)
if not test -x "$bin"
    _log "ERROR: 'opencode' not found in PATH: $PATH"
    exit 127
end

# 4) Start headless server on port 6660 (docs say 'serve')
set -l port 6660
_log "Starting: $bin serve --port $port"
exec "$bin" serve --port $port
