# history filepath
HISTFILE="$HOME/.zsh_history"

# maximum events for internal history
HISTSIZE=10000

# maximum events in history file
SAVEHIST=10000

# options
# setopt autocd nomatch
# unsetopt beep extendedglob notify

# enable the vi mode
# bindkey -v
# KEYTIMEOUT=1

bindkey '^P' up-line-or-search
bindkey '^N' down-line-or-search

###########
# Aliases #
###########

source "$ZDOTDIR/aliases"

################
# Autocomplete #
################

# zstyle :compinstall filename "$ZDOTDIR/.zshrc"

# autoload -Uz compinit
# compinit -d "$HOME/.zcompdump"

# autocomplete hidden files
# _comp_options+=(globdots)

##########
# Bright #
##########

PATH="$HOME/work/git-helpers/bin:$PATH"

###########
# Scripts #
###########

source "$ZDOTDIR/scripts.zsh"

case "$OSTYPE" in
  darwin*)  
    source "$ZDOTDIR/macos.zsh"
    ;;
  linux*)   
    source "$ZDOTDIR/linux.zsh"
    ;;
  *)        
    echo "Unknown OS: $OSTYPE"
    ;;
esac
