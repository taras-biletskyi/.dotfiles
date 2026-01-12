#!/usr/bin/env bash
set -euo pipefail

STATE_FILE="$HOME/.config/hypr/.opacity_full"

# Put your normal values here (the ones you want to restore to)
NORMAL_ACTIVE="0.95"
NORMAL_INACTIVE="0.85"

if [[ -f $STATE_FILE ]]; then
    hyprctl keyword decoration:active_opacity "$NORMAL_ACTIVE" > /dev/null
    hyprctl keyword decoration:inactive_opacity "$NORMAL_INACTIVE" > /dev/null
    rm -f "$STATE_FILE"
else
    hyprctl keyword decoration:active_opacity 1.0 > /dev/null
    hyprctl keyword decoration:inactive_opacity 1.0 > /dev/null
    : > "$STATE_FILE"
fi
