alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias lg='lazygit'
alias g='git'
alias po='poweroff'
function v {
  # 1. Check if already inside tmux
  if [ -n "$TMUX" ]; then
    nvim
    return
  fi

  # 2. Define the session name
  SESSION_NAME="$(basename "$PWD")"
  echo $SESSION_NAME

  # 3. Check if the session exists
  if tmux has-session -t "$SESSION_NAME" 2>/dev/null; then
    # Session exists: Just attach to it
    tmux attach-session -t "$SESSION_NAME"
  else
    # Session does not exist: Create it with two windows
    tmux new-session -d -s "$SESSION_NAME" "nvim"
    tmux new-window -t "$SESSION_NAME" "bash"
    tmux select-window -t "$SESSION_NAME:1"
    tmux attach-session -t "$SESSION_NAME"
  fi
}
