# load external plugins
# fpath=($ZDOTDIR/external $fpath)

# aliases
source "$HOME/.config/zsh/aliases"

# vim mapping for completion
# zmodload zsh/complist
# bindkey -M menuselect 'h' vi-backward-char
# bindkey -M menuselect 'k' vi-up-line-or-history
# bindkey -M menuselect 'l' vi-forward-char
# bindkey -M menuselect 'j' vi-down-line-or-history

# completion
# autoload -Uz compinit; compinit

# autocomplete hidden files
# _comp_options+=(globdots) # With hidden files
# source "$DOTFILES/zsh/external/completion.zsh"

# prompt
# autoload -Uz prompt_purification_setup; prompt_purification_setup

# enable vi mode
# bindkey -v
# export KEYTIMEOUT=1

# change cursor
# autoload -Uz cursor_mode && cursor_mode

# edit commands in neovim
# autoload -Uz edit-command-line
# zle -N edit-command-line
# bindkey -M vicmd v edit-command-line

bindkey '^P' up-line-or-search
bindkey '^N' down-line-or-search

case "$OSTYPE" in
  darwin*)  
    source $HOME/.config/zsh/macos.zsh
    ;;
  linux*)   
    source $HOME/.config/zsh/linux.zsh
    ;;
  *)        
    echo "Unknown OS: $OSTYPE"
    ;;
esac
