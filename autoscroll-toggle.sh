#!/bin/bash
# Toggle script with notification support

CONFIG_FILE="${XDG_CONFIG_HOME:-$HOME/.config}/autoscroll.conf"
[ -f "$CONFIG_FILE" ] && source "$CONFIG_FILE"

# Use XDG-compatible runtime directory
TOGGLE_FILE="${XDG_RUNTIME_DIR:-/tmp}/autoscroll_disabled"

if [ -f "$TOGGLE_FILE" ]; then
    rm "$TOGGLE_FILE"
    notify-send "Autoscroll ENABLED" -t 1000 -i input-mouse -a "Autoscroll"
else
    touch "$TOGGLE_FILE"
    notify-send "Autoscroll DISABLED" -t 1000 -i input-mouse -a "Autoscroll"
fi
