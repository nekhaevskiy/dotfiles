#xrdb -merge $HOME/.config/X11/.Xresources

# automatically mount devices
udiskie &

# needed for Inkdrop
dbus-update-activation-environment DISPLAY XAUTHORITY WAYLAND_DISPLAY

# remap Caps Lock to CTRL and ESC key
setxkbmap -option 'caps:ctrl_modifier';xcape -e 'Caps_Lock=Escape'&

exec i3
