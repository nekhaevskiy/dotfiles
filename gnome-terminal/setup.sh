#!/usr/bin/env bash
# Apply GNOME Terminal settings (OneDark theme + JetBrainsMono Nerd Font)

PROFILE=$(gsettings get org.gnome.Terminal.ProfilesList default | tr -d "'")
SCHEMA="org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:${PROFILE}/"

gsettings set org.gnome.Terminal.Legacy.Keybindings:/org/gnome/terminal/legacy/keybindings/ next-tab '<Ctrl>Tab'
gsettings set org.gnome.Terminal.Legacy.Keybindings:/org/gnome/terminal/legacy/keybindings/ prev-tab '<Ctrl><Shift>Tab'

gsettings set $SCHEMA audible-bell false
gsettings set $SCHEMA background-color '#050608'
gsettings set $SCHEMA foreground-color '#abb2bf'
gsettings set $SCHEMA bold-color '#abb2bf'
gsettings set $SCHEMA bold-color-same-as-fg true
gsettings set $SCHEMA palette "['#282c34', '#e06c75', '#98c379', '#e5c07b', '#61afef', '#c678dd', '#56b6c2', '#abb2bf', '#5c6370', '#e06c75', '#98c379', '#e5c07b', '#61afef', '#c678dd', '#56b6c2', '#ffffff']"
gsettings set $SCHEMA font 'JetBrainsMono Nerd Font 11'
gsettings set $SCHEMA use-system-font false
gsettings set $SCHEMA use-theme-colors false
gsettings set $SCHEMA cell-height-scale 1.0
gsettings set $SCHEMA cell-width-scale 1.0
