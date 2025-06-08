#!/bin/bash
# System-wide autoscroll for Wayland

CONFIG_FILE="${XDG_CONFIG_HOME:-$HOME/.config}/autoscroll.conf"
[ -f "$CONFIG_FILE" ] && source "$CONFIG_FILE"

DISABLE_MIDDLE_PASTE=${DISABLE_MIDDLE_PASTE:-1}
SCROLL_SPEED=${SCROLL_SPEED:-2}
ENABLE_VERTICAL=${ENABLE_VERTICAL:-1}
ENABLE_HORIZONTAL=${ENABLE_HORIZONTAL:-1}

# Disable middlemouse paste if configured
[ "$DISABLE_MIDDLE_PASTE" = "1" ] && echo -n | xsel -n -i

TOGGLE_FILE="${XDG_RUNTIME_DIR:-/tmp}/autoscroll_disabled"
[ -f "$TOGGLE_FILE" ] && exit 0

midlemousebutton=2

eval $(xdotool getmouselocation --shell)
starty=$Y
startx=$X
toggle=$middlemousebutton

while [ $toggle -eq $middlemousebutton ]; do
    eval $(xdotool getmouselocation --shell)
    curry=$Y
    currx=$X

    if [ "$ENABLE_VERTICAL" = "1" ]; then
        if [ $curry -gt $starty ]; then
            speedy=$(( (curry - starty) / 100 ))
            [ $speedy -gt 0 ] && ydotool mousemove -w -- 0 -$((speedy * SCROLL_SPEED))
        else
            speedy=$(( (starty - curry) / 100 ))
            [ $speedy -gt 0 ] && ydotool mousemove -w -- 0 $((speedy * SCROLL_SPEED))
        fi
    fi

    if [ "$ENABLE_HORIZONTAL" = "1" ]; then
        if [ $currx -gt $startx ]; then
            speedx=$(( (currx - startx) / 100 ))
            [ $speedx -gt 0 ] && ydotool mousemove -w -- $((speedx * SCROLL_SPEED)) 0
        else
            speedx=$(( (startx - currx) / 100 ))
            [ $speedx -gt 0 ] && ydotool mousemove -w -- -$((speedx * SCROLL_SPEED)) 0
        fi
    fi

    # TODO: replace xinput for some wayland specific solution to avoid warnings.
    toggle=$(xinput --list "Virtual core pointer" | \
             grep -i -m 1 "Button state:" | \
             grep -o "[$middlemousebutton]\+" || echo "0")
    
    sleep 0.02
done
