###########
# Plugins #
###########

# cargo (rush package manager)
source "$HOME/.cargo/env"

# fzf
source "$HOME/.fzf.zsh"
FZF_DEFAULT_COMMAND="rg --files --hidden --glob '!.git'"
FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# fzf-git
source "$HOME/.fzf-git/fzf-git.sh"
source "$ZDOTDIR/yn-fzf-git.sh"

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                   # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion

# pyenv (needed for JupyterLab)
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - zsh)"

# starship
eval "$(starship init zsh)"

# zoxide
eval "$(zoxide init zsh)"

# zsh-autosuggestions
source "/usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
bindkey '^y' autosuggest-accept # use <C-y> keybinding to accept autosuggestion

# zsh syntax highlighting
source "/usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
