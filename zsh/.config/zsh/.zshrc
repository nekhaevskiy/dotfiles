# history filepath
HISTFILE="$HOME/.zsh_history"

# maximum events for internal history
HISTSIZE=10000

# maximum events in history file
SAVEHIST=10000

# options
setopt autocd nomatch
unsetopt beep extendedglob notify

# enable the vi mode
bindkey -v
KEYTIMEOUT=1

bindkey '^P' up-line-or-search
bindkey '^N' down-line-or-search

###########
# Aliases #
###########

source "$ZDOTDIR/aliases"

################
# Autocomplete #
################

zstyle :compinstall filename "$ZDOTDIR/.zshrc"

autoload -Uz compinit
compinit -d "$HOME/.zcompdump"

# autocomplete hidden files
_comp_options+=(globdots)

###########
# Plugins #
###########

# fzf
source <(fzf --zsh)
FZF_DEFAULT_COMMAND="rg --files --hidden --glob '!.git'"
FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# starship
eval "$(starship init zsh)"

# zoxide
eval "$(zoxide init zsh)"

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

##########
# Bright #
##########

PATH="$HOME/work/git-helpers/bin:$PATH"

###########
# Scripts #
###########

source "$ZDOTDIR/scripts.zsh"
