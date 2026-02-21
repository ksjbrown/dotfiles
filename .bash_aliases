alias cdd='cd ~/develop'
alias g='git'
alias gg='lazygit'
alias l='ls -lhF'
alias ll='ls -lhAF'
alias po='poweroff'
alias py='python3'
alias v='nvim'
alias t='tmux new -A -s default'
alias tn='tmux new -A -s'
alias ta='tmux attach -t'
alias tl='tmux ls'
alias tkS='tmux kill-server'
alias tks='tmux kill-session -t'
function tm {
  # 1. Check if already inside tmux
  if [ -n "$TMUX" ]; then
    return
  fi

  # 2. Define the session name
  SESSION_NAME="$(basename "$PWD")"

  # 3. Check if the session exists
  if tmux has-session -t "$SESSION_NAME" 2>/dev/null; then
    # Session exists: Just attach to it
    tmux attach-session -t "$SESSION_NAME"
  else
    # Session does not exist: 
    tmux new-session -d -s "$SESSION_NAME" 
    tmux attach-session -t "$SESSION_NAME"
  fi
}
