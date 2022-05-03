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
export PATH=$HOME/bin:$PATH
export PATH=$HOME/.anyenv/bin:$PATH
export PATH=$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH # yarn
export PATH=$HOME/go/bin:/usr/local/go/bin:$GOPATH/bin:$PATH # go
export PATH=/usr/local/opt/openssl/bin:$PATH # openssl
