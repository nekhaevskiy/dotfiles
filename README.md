# Dotfiles

Clone the repo:

```bash
cd ~ && git clone https://github.com/nekhaevskiy/dotfiles.git
```

Use [GNU Stow](https://www.gnu.org/software/stow/) for creating symlinks:

```bash
cd dotfiles
stow git
stow nvim
...

# On macOS
stow zsh-macos

# On Ubuntu
stow zsh-linux
```

## Ubuntu dependencies

Install required tools:

```bash
# Core
sudo apt install zsh stow ripgrep zsh-autosuggestions zsh-syntax-highlighting

# Set zsh as default shell (log out and back in after)
chsh -s $(which zsh)

# fzf (apt version is too old, install from GitHub)
LATEST=$(curl -s https://api.github.com/repos/junegunn/fzf/releases/latest | grep -Po '"tag_name": *"v\K[^"]*')
curl -Lo /tmp/fzf.tar.gz "https://github.com/junegunn/fzf/releases/download/v${LATEST}/fzf-${LATEST}-linux_amd64.tar.gz"
tar xf /tmp/fzf.tar.gz -C /tmp fzf
sudo install /tmp/fzf -D -t /usr/local/bin/

# starship
curl -sS https://starship.rs/install.sh | sh

# zoxide
curl -sS https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | bash

# lazygit
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": *"v\K[^"]*')
curl -Lo /tmp/lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/download/v${LAZYGIT_VERSION}/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf /tmp/lazygit.tar.gz -C /tmp lazygit
sudo install /tmp/lazygit -D -t /usr/local/bin/

# JetBrains Mono Nerd Font
mkdir -p ~/.local/share/fonts
cd ~/.local/share/fonts
wget https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.zip
unzip JetBrainsMono.zip -d JetBrainsMono
rm JetBrainsMono.zip
fc-cache -fv

# Snap packages
sudo snap install nvim --classic
sudo snap install zellij --classic
sudo snap install yazi
```

## GNOME Terminal (Ubuntu)

GNOME Terminal settings are not file-based and can't be managed with Stow. Apply them with:

```bash
bash ~/dotfiles/gnome-terminal/setup.sh
```

Requires [JetBrains Mono Nerd Font](https://www.nerdfonts.com/) to be installed first.

## Yazi

After stowing, install plugins with:

```bash
yazi.ya pkg install
```

> Note: yazi is installed via snap, so the package manager CLI is `yazi.ya` instead of `ya`.
