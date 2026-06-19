#!/usr/bin/env bash
# Enable "Tasks in Panel" + show the focused window's title in the top bar
set -euo pipefail

UUID=tasks-in-panel@fthx
SCH=org.gnome.shell.extensions.tasks-in-panel

gnome-extensions enable "$UUID"

gsettings set $SCH show-focused-window true   # only the active window
gsettings set $SCH show-window-title  true    # ...and its title text
gsettings set $SCH show-window-icon   true
