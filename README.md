# Config Files

## Installing

Run below commands in zsh:

```sh
git clone git@github.com:ksjbrown/dotfiles.git ~/dotfiles

# zsh
ln -sf ~/dotfiles/.zshrc ~/.zshrc
ln -sf ~/dotfiles/.aliases ~/.aliases

# lazygit
ln -sf ~/dotfiles/.config/lazygit ~/.config/lazygit

# nvim
rm -rf ~/.config/nvim
ln -sf ~/dotfiles/.config/nvim ~/.config/nvim

# tmux
mkdir -p ~/.config/tmux
ln -sf ~/dotfiles/.config/tmux ~/.config/tmux
```
