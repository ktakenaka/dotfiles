# Fig pre block. Keep at the top of this file.
[[ -f "$HOME/.fig/shell/zshrc.pre.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.pre.zsh"

if [ -x /usr/bin/direnv ]; then
  eval "$(direnv hook zsh)"
  if ! [ -f /tmp/direnv.cache ]; then
    direnv hook zsh > /tmp/direnv.cache
    zcompile /tmp/direnv.cache
  fi
  source /tmp/direnv.cache
fi

if [ -x ${HOME}/.anyenv/bin/anyenv ]; then
  eval "$(anyenv init -)"
  if ! [ -f /tmp/anyenv.cache ]; then
    anyenv init - --no-rehash > /tmp/anyenv.cache
    zcompile /tmp/anyenv.cache
  fi
  source /tmp/anyenv.cache
fi

# ------ #
# colors #
# ------ #
autoload -Uz colors && colors
export LSCOLORS=gxfxxxxxcxxxxxxxxxgxgx
export LS_COLORS='di=01;36:ln=01;35:ex=01;32'

# -------------- #
# 2-line display #
# -------------- #
PROMPT="%{${fg[green]}%}%n %{${fg[blue]}%}@ %~  %{$fg[magenta]%}%D/%T
%{${reset_color}%}:) %{${fg[cyan]}%}$%{${reset_color}%} "

# ----- #
# alias #
# ----- #
alias ls='ls -G -F'
alias la='ls -A'
alias ll='ls -lh'
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias mkdir='mkdir -p'
alias reload='exec zsh -l'
alias gi='git'
alias gis='git status'
alias gib='git branch'
alias gia='git add'
alias gic='git checkout'
alias gim='git commit --amend -C HEAD --date=now'
alias gif='git fetch -p'
alias gip='git pull'
alias mysqlbinlogv='mysqlbinlog --base64-output=DECODE-ROWS -vv'
alias curltime='curl -so /dev/nul -w "   time_namelookup:  %{time_namelookup}\n      time_connect:  %{time_connect}\n   time_appconnect:  %{time_appconnect}\n  time_pretransfer:  %{time_pretransfer}\n     time_redirect:  %{time_redirect}\ntime_starttransfer:  %{time_starttransfer}\n                    ----------\n        time_total:  %{time_total}\n"'
alias starttmux="tmux attach -t default || tmux new -s default"

# Fig post block. Keep at the bottom of this file.
[[ -f "$HOME/.fig/shell/zshrc.post.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.post.zsh"
