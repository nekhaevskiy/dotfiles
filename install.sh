#!/bin/bash

########
# nvim #
########

# mkdir -p "$HOME/.config/nvim"
# mkdir -p "$HOME/.config/nvim/undo"

# ln -sf "$HOME/dotfiles/nvim/init.vim" "$HOME/.config/nvim"

#######
# X11 #
#######

rm -rf "$HOME/.config/X11"
ln -s "$HOME/dotfiles/X11" "$HOME/.config"

######
# i3 #
######

rm -rf "$HOME/.config/i3"
ln -s "$HOME/dotfiles/i3" "$HOME/.config"

#########
# fonts #
#########

mkdir -p "$XDG_DATA_HOME"
cp -rf "$DOTFILES/fonts" "$XDG_DATA_HOME"

#############
# alacritty #
#############

rm -rf "$HOME/.config/alacritty"
ln -s "$HOME/dotfiles/alacritty" "$HOME/.config"

###########
# zathura #
###########

rm -rf "$HOME/.config/zathura"
ln -s "$HOME/dotfiles/zathura" "$HOME/.config"
