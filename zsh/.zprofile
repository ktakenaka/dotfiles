# ============= #
# Login Shell   #
# ============= #
# This file is sourced for LOGIN shells only
# Use for PATH setup and login-specific initialization

# ---- #
# PATH #
# ---- #
add_to_path_if_not_exists "$HOME/.local/bin"
add_to_path_if_not_exists "${KREW_ROOT:-$HOME/.krew}/bin"

os=$(uname -s)
if [ "$os" = "Darwin" ]; then
  PATH="/opt/homebrew/sbin:${PATH//\/opt\/homebrew\/sbin:/}"
  PATH="/opt/homebrew/bin:${PATH//\/opt\/homebrew\/bin:/}"
fi

# ---- #
# tmux #
# ---- #
# Run tmux on login shell (Mac only, not over SSH)
if [ "$os" = "Darwin" ] && command -v tmux >/dev/null 2>&1 && [ -z "$SSH_CONNECTION" ] && [ -z "$TMUX" ]; then
  tmux attach -t default 2>/dev/null || tmux new-session -s default
fi
