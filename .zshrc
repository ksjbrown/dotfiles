# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
PROMPT=$'%B%F{183}%~%f%b\n%# '

autoload -Uz compinit
compinit
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' ignore-parents parent pwd

setopt glob_dots no_auto_menu

bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

source ~/.aliases
