# merge .Xresources config with the local settings of the applications
xrdb -merge $HOME/.config/X11/.Xresources

# run URxvt's daemon
urxvtd -o -q -f

# automatically mount devices
udiskie &

# remap Caps Lock to CTRL and ESC key
setxkbmap -option 'caps:ctrl_modifier'&

# run i3-wm
exec i3
