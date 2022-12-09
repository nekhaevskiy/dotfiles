#xrdb -merge $HOME/.config/X11/.Xresources

# automatically mount devices
udiskie &

# remap Caps Lock to CTRL and ESC key
setxkbmap -option 'caps:ctrl_modifier'&

exec i3
