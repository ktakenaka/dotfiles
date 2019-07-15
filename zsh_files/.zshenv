# --------------------- #
# display files when cd #
# --------------------- #
cdls () { \cd "$@" && ls }
alias cd="cdls"

# --- #
# fzf #
# --- #
function single-fzf-choice() {
  fzf --height=20 --no-sort +m --query "$1" --prompt="$2 > "
}
function ghq-interactive-directory-select-and-cd() {
  target=$(ghq list | single-fzf-choice "$1" "Repository")
  if [ -z $target ]; then
    return 0
  fi
  cd $(ghq root)/$target
}
alias gcd=ghq-interactive-directory-select-and-cd # Git Change Directory

# ----------------------------- #
# fd - cd to selected directory #
# ----------------------------- #
fd() {
  local dir
  dir=$(find ${1:-.} -path '*/\.*' -prune \
                  -o -type d -print 2> /dev/null | fzf +m) &&
  cd "$dir"
}

# ---- #
# peco #
# ---- #
function peco-history-selection() {
    BUFFER=`history -n 1 | tail -r  | awk '!a[$0]++' | peco`
    CURSOR=$#BUFFER
    zle reset-prompt
}

zle -N peco-history-selection
bindkey '^R' peco-history-selection

# -------- #
# vcs_info #
# -------- #
autoload -Uz vcs_info
zstyle ':vcs_info:*' formats '%F{cyan}(%b)%f'
zstyle ':vcs_info:*' actionformats '%F{red}(%s)-[%b|%a]%f'

autoload -Uz add-zsh-hook
function _update_vcs_info_msg() {
    LANG=en_US.UTF-8 vcs_info
    RPROMPT="${vcs_info_msg_0_}"
}
add-zsh-hook precmd _update_vcs_info_msg

echo 'i am zshenv'
