# Config Files

## Installing

Run below commands in zsh:

```sh
git clone git@github.com:ksjbrown/dotfiles.git ~/dotfiles

# zsh
echo 'export ZDOTDIR="$HOME/.config/zsh"' > ~/.zshenv
ln -sf ~/dotfiles/zsh ~/.config/zshrc

# lazygit
ln -sf ~/dotfiles/lazygit ~/.config/lazygit

# nvim
ln -sf ~/dotfiles/nvim ~/.config/nvim

# tmux
ln -sf ~/dotfiles/tmux ~/.config/tmux
```
