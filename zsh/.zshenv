# --------------------- #
# display files when cd #
# --------------------- #
cdls () { \cd "$@" && ls }
alias cd="cdls"

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

# -- #
# fd #
# -- #
function fd() {
  local dir
  dir=$(find ${1:-.} -path '*/\.*' -prune \
                  -o -type d -print 2> /dev/null | fzf +m) &&
  cd "$dir"
}

# --- #
# gcd #
# --- #
function single-fzf-choice() {
  fzf --height=20 --no-sort +m --query "$1" --prompt="$2 > "
}
function ghq-interactive-directory-select-and-cd() {
  target=$(ghq list | single-fzf-choice "$1" "Repository")
  if [ -z $target ]; then
    return 0
  fi
  echo $target
  cd $(ghq root)/$target
}
alias gcd="ghq-interactive-directory-select-and-cd"

# ---- #
# fgcd #
# ---- #
function foreground-cd() {
  target=$(jobs | single-fzf-choice "$1" "background jobs")
  if [ -z $target ]; then
    return 0
  fi
  fg $(echo ${target} | awk '{print "%"substr($1, 2, 1)}')
}
alias fgcd="foreground-cd"

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

# ---- #
# path #
# ---- #
export PATH=$PATH:/usr/sbin:/usr/bin:/usr/local/sbin:/usr/local/bin:/sbin:/bin
export PATH=/opt/homebrew/sbin:/opt/homebrew/bin:$PATH # M1 Mac
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH" # krew (kubectl)
export PATH=$HOME/bin:$PATH
export PATH=$HOME/.anyenv/bin:$PATH
export PATH=$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH # yarn
export PATH=$HOME/go/bin:/usr/local/go/bin:$GOPATH/bin:$PATH # go
export PATH=/usr/local/opt/openssl/bin:$PATH # openssl
