# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
PROMPT=$'%F{116}%~%f\n%# '

zstyle :compinstall filename '/data/data/com.termux/files/home/.zshrc'
autoload -Uz compinit
compinit

setopt extendedglob noautomenu nomatch share_history
unsetopt autocd beep notify
bindkey "^[[A" history-beginning-search-backward
bindkey "^[[B" history-beginning-search-forward

source ~/.bash_aliases
