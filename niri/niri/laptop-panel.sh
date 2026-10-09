#!/usr/bin/env bash
# Turn the internal laptop panel OFF whenever any external (HDMI/DP) display is
# connected, and back ON when it's the only display left. GDM lights the panel
# before login; this reconciles once niri is up and on every hotplug after.
#
# Internal = connector name starting eDP / LVDS / DSI. External = anything else.
# ponytail: 3s poll instead of a hotplug event. niri's IPC has no reliable
# output-hotplug event, and one cheap `niri msg` every 3s is nothing. Swap in
# kanshi/way-displays if you ever want event-driven instead.
set -euo pipefail

last=""
while :; do
    mapfile -t outs < <(niri msg --json outputs | jq -r 'keys[]')

    internal=() external=()
    for o in "${outs[@]}"; do
        if [[ $o =~ ^(eDP|LVDS|DSI) ]]; then internal+=("$o"); else external+=("$o"); fi
    done

    # No internal panel (e.g. a desktop): nothing to ever manage, so exit
    # instead of polling forever. A hotplugged eDP/LVDS/DSI panel is not a
    # thing, so this set can't become non-empty later.
    if ((${#internal[@]} == 0)); then exit 0; fi

    desired=$(( ${#external[@]} > 0 ? 0 : 1 ))   # 0 = off, 1 = on
    if [[ $desired != "$last" ]]; then
        state=$([[ $desired == 1 ]] && echo on || echo off)
        for i in "${internal[@]}"; do niri msg output "$i" "$state" || true; done
        last=$desired
    fi
    sleep 3
done
