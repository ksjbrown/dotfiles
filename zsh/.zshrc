HISTFILE="$ZDOTDIR/.history"
HISTSIZE=1000
SAVEHIST=1000

autoload -Uz vcs_info
precmd() { vcs_info }
zstyle ':vcs_info:git:*' formats '(%F{cyan}%b%f%u%c)'
zstyle ':vcs_info:git:*' actionformats '(%F{cyan}%b%f|%F{red}%a%f%u%c)'
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' unstagedstr '%F{red}*%f'
zstyle ':vcs_info:*' stagedstr '%F{green}+%f'

setopt PROMPT_SUBST
PROMPT='%B%F{13}%~%f%b ${vcs_info_msg_0_}
%# '

autoload -Uz compinit && compinit 
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' ignore-parents parent pwd

setopt glob_dots no_auto_menu

bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
bindkey "^[[3~" delete-char

source $ZDOTDIR/.aliases

# extended setup
if [ -d $ZDOTDIR/scripts ]; then
    for file in $ZDOTDIR/scripts/*.zsh(N); do
    source "$file"
  done
fi

export PATH="$HOME/.local/bin:$PATH"
