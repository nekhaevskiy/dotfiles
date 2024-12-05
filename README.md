# Dotfiles

Clone the repo:

```bash
cd ~ && git clone https://github.com/nekhaevskiy/dotfiles.git
```

Use [GNU Stow](https://www.gnu.org/software/stow/) for creating symlinks:

```bash
cd dotfiles
stow git
stow kitty
stow nvim
...
```
