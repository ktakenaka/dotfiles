# ======================= #
# Environment Variables   #
# ======================= #
# This file is sourced for ALL shells (interactive, non-interactive, login, non-login)
# Keep only environment variables here - no functions, aliases, or interactive features

# ------------------------- #
# add_to_path_if_not_exists #
# ------------------------- #
# This function is needed early for PATH setup in .zprofile
add_to_path_if_not_exists() {
  local directory=$1
  # shellの中でshellを起動すると、zprofileのpathが何回も追加されるので、それを防ぎたい
  if [[ -d "$directory" ]] && [[ "$PATH" != *":$directory:"* ]]; then
    export PATH="$directory:$PATH"
  fi
}

# ------------ #
# locale/shell #
# ------------ #
export LANG=ja_JP.UTF-8
export LC_ALL=en_US.UTF-8

# ------- #
# history #
# ------- #
export HISTFILE=${HOME}/.zsh_history # 履歴ファイルの保存先
export HISTSIZE=1000                 # メモリに保存される履歴の件数
export SAVEHIST=5000                 # 履歴ファイルに保存される履歴の件数

# ------ #
# colors #
# ------ #
export CLICOLOR=1
export LSCOLORS=gxfxxxxxcxxxxxxxxxgxgx
export LS_COLORS='di=01;36:ln=01;35:ex=01;32'
