#!/bin/bash
# Toggle floating with a fixed size (1280x800) and center, or back to tiled.

floating=$(hyprctl activewindow -j | jq -r '.floating')

if [ "$floating" = "true" ]; then
  hyprctl dispatch togglefloating
else
  hyprctl --batch "dispatch togglefloating; dispatch resizeactive exact 1600 1200; dispatch centerwindow"
fi
