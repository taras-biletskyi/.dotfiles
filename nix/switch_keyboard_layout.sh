#!/bin/bash
# ~/.config/hypr/switch-layout

# Get the active keymap for the FIRST keyboard (adjust index if needed)
current=$(hyprctl -j devices | jq -r '.keyboards[0].active_keymap')

case "$current" in
    "English (US)") hyprctl keyword input:kb_layout ru ;;
    "Russian")      hyprctl keyword input:kb_layout ua ;;
    "Ukrainian")    hyprctl keyword input:kb_layout us ;;
    *)              hyprctl keyword input:kb_layout us ;; # Fallback
esac

# Notify about the change (optional)
# notify-send "Layout: $(hyprctl -j devices | jq -r '.keyboards[0].active_keymap')"
