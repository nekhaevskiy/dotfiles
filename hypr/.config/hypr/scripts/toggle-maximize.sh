#!/bin/bash
# Toggle fullscreen maximize while managing aspect ratio constraint

# Get current fullscreen state of active window
fullscreen_state=$(hyprctl activewindow -j | jq -r '.fullscreen')

if [ "$fullscreen_state" = "false" ] || [ "$fullscreen_state" = "0" ]; then
    # Not fullscreen - disable aspect ratio and maximize
    hyprctl keyword dwindle:single_window_aspect_ratio "0 0"
    hyprctl dispatch fullscreen 1
else
    # Already fullscreen - restore and un-maximize
    hyprctl dispatch fullscreen 1
    hyprctl keyword dwindle:single_window_aspect_ratio "4 3"
fi
