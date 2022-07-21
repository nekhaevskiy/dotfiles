xrdb -merge $XDG_CONFIG_HOME/X11/.Xresources

# automatically mount devices
udiskie &

# remap Caps Lock to CTRL and ESC key
setxkbmap -option 'caps:ctrl_modifier';xcape -e 'Caps_Lock=Escape'&

exec i3
