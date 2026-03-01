# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
PROMPT=$'%B%F{183}%~%f%b\n%# '

autoload -Uz compinit
compinit
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' ignore-parents parent pwd

setopt extendedglob glob_dots noautomenu nomatch share_history
unsetopt autocd beep notify

source ~/.aliases
