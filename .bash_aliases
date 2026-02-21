alias cdd='cd ~/develop/'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias lg='lazygit'
alias g='git'
alias po='poweroff'
alias py='python3'
alias v='nvim'
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
