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


