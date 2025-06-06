# history filepath
HISTFILE="$HOME/.zsh_history"

# maximum events for internal history
HISTSIZE=10000

# maximum events in history file
SAVEHIST=10000

# amount of time that Zsh waits for the next key in a multi-key sequence
KEYTIMEOUT=100

# options
setopt autocd nomatch
# unsetopt beep extendedglob notify

bindkey '^P' up-line-or-search
bindkey '^N' down-line-or-search

###########
# Aliases #
###########

source "$ZDOTDIR/aliases"

# Neovim switcher
alias nvim-lazy="NVIM_APPNAME=LazyVim nvim"

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

source "$ZDOTDIR/scripts.sh"

case "$OSTYPE" in
darwin*)
  source "$ZDOTDIR/macos.sh"
  source "$ZDOTDIR/macos-scripts.sh"
  ;;
linux*)
  source "$ZDOTDIR/linux.sh"
  source "$ZDOTDIR/linux-scripts.sh"
  ;;
*)
  echo "Unknown OS: $OSTYPE"
  ;;
esac
