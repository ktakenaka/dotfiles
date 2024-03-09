# Fig pre block. Keep at the top of this file.
[[ -f "$HOME/.fig/shell/zshrc.pre.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.pre.zsh"

if command -v direnv >/dev/null 2>&1; then
  eval "$(direnv hook zsh)"
fi

if command -v anyenv >/dev/null 2>&1 && [ -z "$ANYENV_INITIALIZED" ]; then
  eval "$(anyenv init -)"
  # FIXME: Don't know exactly, but it duplicates paths in reloading by executing init several times. So, make it idempotent.
  export ANYENV_INITIALIZED=1
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
if [ "$(uname -s)" = "Darwin" ]; then
  PROMPT="%{${fg[green]}%}%n%{${fg[blue]}%}@%~  %{$fg[magenta]%}%D/%T
%{${reset_color}%}:) %{${fg[cyan]}%}$%{${reset_color}%} "
else
  PROMPT='%F{black}%n@%m%f:%F{black}%~%f$ '
fi

if command -v tmux >/dev/null 2>&1 && [ "$(uname -s)" = "Darwin" ] && [ -z "$TMUX" ]; then
  # It's a bit inconvenient to attach tmux session in Linux. That's why tmux is used by default only on Mac.
  if ! tmux attach -t default 2>/dev/null; then
    tmux new-session -d -s default
    tmux attach -t default
  fi
fi

# Fig post block. Keep at the bottom of this file.
[[ -f "$HOME/.fig/shell/zshrc.post.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.post.zsh"
