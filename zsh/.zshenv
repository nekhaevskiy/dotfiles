# dotfiles
export DOTFILES="$HOME/dotfiles"

# editor
export EDITOR="nvim"

# fzf
# export FZF_DEFAULT_COMMAND='rg --hidden -l ""'

# man
export MANPAGER='nvim +Man!'
export MANWIDTH=999

# IBus (different input methods)
export GTK_IM_MODULE="ibus"
export QT_IM_MODULE="ibus"
export XMODIFIERS="@im=ibus"

# PATH
export PATH="$HOME/work/git-helpers/bin:$PATH" # Bright Git Extensions
# export PATH="$HOME/.local/bin":$PATH
# export PATH="$HOME/.local/share/neovim/bin":$PATH
# export PATH="$PATH:./node_modules/.bin"

# terminal
export TERMINAL="alacritty"

# XDG
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

# zsh
export ZDOTDIR="$HOME/.config/zsh"
