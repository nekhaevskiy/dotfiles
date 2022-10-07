###########
# Options #
###########

setopt AUTO_CD # `cd` is no longer needed
setopt EXTENDED_GLOB # treat the `#`, `~` and `^` characters as part of patterns for filename generation
setopt NOMATCH # if a pattern for filename generation has no matches, print an error
setopt NOTIFY # report the status of background jobs immediately
setopt BEEP # beep on error in ZLE

###########
# Aliases #
###########

source "$ZDOTDIR/aliases"

##############
# Completion #
##############

zmodload zsh/complist
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'p' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'n' vi-down-line-or-history
autoload -Uz compinit; compinit
_comp_options+=(globdots) # with hidden files
zstyle ':completion:*' menu select # allow to select in a menu
zstyle ":completion:*" matcher-list "m:{a-z}={A-Za-z}" # do not need capital letters anymore

###########
# History #
###########

HISTFILE="$ZDOTDIR/.histfile"
HISTSIZE=10000
SAVEHIST=10000
setopt HIST_IGNORE_ALL_DUPS # history won't save duplicates
setopt HIST_FIND_NO_DUPS # history won't show duplicates on search
setopt SHARE_HISTORY # both import and export typed commands to the history file

##########
# Prompt #
##########

autoload -U promptinit; promptinit
prompt pure

###########
# Plugins #
###########

# fzf
source "/usr/share/fzf/completion.zsh"
source "/usr/share/fzf/key-bindings.zsh"

# nvm
source "/usr/share/nvm/init-nvm.sh"

# zoxide
eval "$(zoxide init zsh)"

# zsh-autosuggestions
source "/usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh"
bindkey "^y" autosuggest-accept # use <Ctrl-y> keybinding

# zsh-syntax-highlighting
source "/usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

# automatically starting i3
if [ "$(tty)" = "/dev/tty1" ]; then
    pgrep i3 || exec startx "$HOME/.config/X11/.xinitrc"
fi
