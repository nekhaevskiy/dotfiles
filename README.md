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
stow ghostty
stow ghostty-macos

# On Linux
stow ghostty
stow ghostty-linux
```
