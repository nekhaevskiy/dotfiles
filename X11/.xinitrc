xrdb -merge $HOME/.config/X11/.Xresources
urxvtd -o -q -f

# automatically mount devices
udiskie &

# remap Caps Lock to CTRL and ESC key
setxkbmap -option 'caps:ctrl_modifier';xcape -e 'Caps_Lock=Escape'&

exec i3
