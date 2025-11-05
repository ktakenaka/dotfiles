# Amazon Q pre block. Keep at the top of this file.
[[ -f "${HOME}/Library/Application Support/amazon-q/shell/zprofile.pre.zsh" ]] && builtin source "${HOME}/Library/Application Support/amazon-q/shell/zprofile.pre.zsh"

# ---- #
# path #
# ---- #
os=$(uname -s)
if [ "$os" = "Darwin" ]; then
  PATH="/opt/homebrew/sbin:${PATH//\/opt\/homebrew\/sbin:/}"
  PATH="/opt/homebrew/bin:${PATH//\/opt\/homebrew\/bin:/}"
elif [ "$os" = "Linux" ]; then
  # No special paths for Linux at the moment
fi
add_to_path_if_not_exists "${KREW_ROOT:-$HOME/.krew}/bin"

# Run tmux on login shell
if command -v tmux >/dev/null 2>&1 && [ -z "$SSH_CONNECTION" ] && [ -z "$TMUX" ]; then
  # It's a bit inconvenient to attach tmux session in Linux. That's why tmux is used by default only on Mac.
  if ! tmux attach -t default 2>/dev/null; then
    tmux new-session -d -s default
    tmux attach -t default
  fi
fi

# Amazon Q post block. Keep at the bottom of this file.
[[ -f "${HOME}/Library/Application Support/amazon-q/shell/zprofile.post.zsh" ]] && builtin source "${HOME}/Library/Application Support/amazon-q/shell/zprofile.post.zsh"
