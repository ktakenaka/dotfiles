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
if [ "$os" = "Darwin" ] && [ -x /opt/homebrew/bin/brew ]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# ---- #
# tmux #
# ---- #
# Run tmux on login shell (not over SSH, not in VSCode/Cursor)
if command -v tmux >/dev/null 2>&1 && [ -z "$SSH_CONNECTION" ] && [ -z "$TMUX" ] && [ "$TERM_PROGRAM" != "vscode" ]; then
  tmux attach -t default 2>/dev/null || tmux new-session -s default
fi
