# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
PROMPT=$'%F{116}%~%f\n%# '

autoload -Uz compinit
compinit
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

setopt extendedglob glob_dots noautomenu nomatch share_history
unsetopt autocd beep notify

alias ls='ls --color=auto'
source ~/.bash_aliases
