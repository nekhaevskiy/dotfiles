###########
# Plugins #
###########

# cargo (rush package manager)
# source "$HOME/.cargo/env"

# fzf
source <(fzf --zsh)
FZF_DEFAULT_COMMAND="rg --files --hidden --glob '!.git'"
FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# fzf-git
source "$HOME/.fzf-git/fzf-git.sh"
source "$ZDOTDIR/yn-fzf-git.sh"

# nvm
source /usr/share/nvm/init-nvm.sh

# pyenv (needed for JupyterLab)
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - zsh)"

# starship
eval "$(starship init zsh)"

# zoxide
eval "$(zoxide init zsh)"

# zsh-autosuggestions
source "/usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh"
bindkey '^y' autosuggest-accept # use <C-y> keybinding to accept autosuggestion

# zsh syntax highlighting
source "/usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
