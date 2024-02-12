# Fig pre block. Keep at the top of this file.
[[ -f "$HOME/.fig/shell/zshrc.pre.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.pre.zsh"

# ------ #
# colors #
# ------ #
autoload -Uz colors && colors
export LSCOLORS=gxfxxxxxcxxxxxxxxxgxgx
export LS_COLORS='di=01;36:ln=01;35:ex=01;32'

# -------------- #
# 2-line display #
# -------------- #
if [ "$(uname -s)" = "Darwin" ]; then
  PROMPT="%{${fg[green]}%}%n%{${fg[blue]}%}@%~  %{$fg[magenta]%}%D/%T
%{${reset_color}%}:) %{${fg[cyan]}%}$%{${reset_color}%} "
else
  PROMPT='%F{black}%n@%m%f:%F{black}%~%f$ '
fi


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

if command -v tmux >/dev/null 2>&1 && [ "$(uname -s)" = "Darwin" ] && [ -z "$TMUX" ]; then
  # It's a bit inconvenient to attach tmux session in Linux. That's why tmux is used by default only on Mac.
  if ! tmux attach -t default 2>/dev/null; then
    tmux new-session -d -s default
    tmux attach -t default
  fi
fi

# Fig post block. Keep at the bottom of this file.
[[ -f "$HOME/.fig/shell/zshrc.post.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.post.zsh"
