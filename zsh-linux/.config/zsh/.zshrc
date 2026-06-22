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

bindkey '^P' up-line-or-search
bindkey '^N' down-line-or-search

###########
# Aliases #
###########

source "$ZDOTDIR/aliases"

##########
# Bright #
##########

PATH="$HOME/work/git-helpers/bin:$PATH"

###########
# Scripts #
###########

source "$ZDOTDIR/scripts.sh"

###########
# Plugins #
###########

# fzf
source <(fzf --zsh)
FZF_DEFAULT_COMMAND="rg --files --hidden --glob '!.git'"
FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# fzf-git
# source "$HOME/fzf-git.sh/fzf-git.sh"
# source "$ZDOTDIR/yn-fzf-git.sh"

# nvm
export NVM_DIR="$HOME/.nvm"                                                                                                                                                                
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm                                                                                                                         
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion  

# pyenv (needed for JupyterLab)
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - zsh)"
eval "$(pyenv virtualenv-init -)"

# starship
eval "$(starship init zsh)"

# zoxide
eval "$(zoxide init zsh --cmd cd)"

# zsh-autosuggestions
source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
bindkey '^y' autosuggest-accept

# zsh-syntax-highlighting (must be last)
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# Claude
export PATH="$HOME/.local/bin:$PATH"
