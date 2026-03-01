# Config Files

## Installing

Run below commands in zsh:

```sh
setopt interactive_comments

git clone git@github.com:ksjbrown/dotfiles.git ~/dotfiles

# zsh
ln -sf ~/dotfiles/.zshrc ~/.zshrc
ln -sf ~/dotfiles/.bash_aliases ~/.bash_aliases

# git
mkdir -p ~/.config/git
ln -sf ~/dotfiles/.config/git/config ~/.config/git/config

# lazygit
mkdir -p ~/.config/lazygit
ln -sf ~/dotfiles/.config/lazygit/config.yml ~/.config/lazygit/config.yml

# nvim
rm -rf ~/.config/nvim
ln -sf ~/dotfiles/.config/nvim ~/.config/nvim

# tmux
mkdir -p ~/.config/tmux
ln -sf ~/dotfiles/.config/tmux/tmux.conf ~/.config/tmux/tmux.conf
```
