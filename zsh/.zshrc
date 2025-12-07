# ==================== #
# Interactive Shell    #
# ==================== #
# This file is sourced for INTERACTIVE shells only
# Use for aliases, functions, completions, keybindings, and prompt

# ------ #
# direnv #
# ------ #
if command -v direnv >/dev/null 2>&1; then
  eval "$(direnv hook zsh)"
fi

# ------ #
# anyenv #
# ------ #
add_to_path_if_not_exists "$HOME/.anyenv/bin"
if command -v anyenv >/dev/null 2>&1 && [ -z "$ANYENV_INITIALIZED" ]; then
  eval "$(anyenv init -)"
  export ANYENV_INITIALIZED=1
fi

# ------ #
# colors #
# ------ #
autoload -Uz colors && colors

# --------- #
# functions #
# --------- #

# display files when cd
cdls() { \cd "$@" && ls }

# peco history selection
peco-history-selection() {
  BUFFER=$(history -n 1 | tail -r | awk '!a[$0]++' | peco)
  CURSOR=$#BUFFER
  zle reset-prompt
}

# fd - find directory and cd
fd() {
  local dir
  dir=$(find ${1:-.} -path '*/\.*' -prune \
                  -o -type d -print 2> /dev/null | fzf +m) &&
  cd "$dir"
}

# single fzf choice helper
single-fzf-choice() {
  fzf --height=20 --no-sort +m --query "$1" --prompt="$2 > "
}

# gcd - ghq + fzf directory select
ghq-interactive-directory-select-and-cd() {
  target=$(ghq list | single-fzf-choice "$1" "Repository")
  if [ -z "$target" ]; then
    return 0
  fi
  echo "$target"
  cd "$(ghq root)/$target"
}

# fgcd - foreground job select
foreground-cd() {
  target=$(jobs | single-fzf-choice "$1" "background jobs")
  if [ -z "$target" ]; then
    return 0
  fi
  fg $(echo "${target}" | awk '{print "%"substr($1, 2, 1)}')
}

# gsed - git grep + sed
gsed() {
  git grep -l "$1" | xargs sed -i '' -e "s/$1/$2/g"
}

# ----- #
# alias #
# ----- #
alias cd="cdls"
alias gcd="ghq-interactive-directory-select-and-cd"
alias fgcd="foreground-cd"

alias ls='ls --color=auto -G -F'
alias la='ls -A'
alias ll='ls -lh'
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

alias gi='git'
alias gis='git status'
alias gib='git branch'
alias gic='git checkout'
alias gim='git commit --amend -C HEAD --date=now'
alias gif='git fetch -p'

alias mysqlbinlogv='mysqlbinlog --base64-output=DECODE-ROWS -vv'
alias curltime='curl -so /dev/null -w "   time_namelookup:  %{time_namelookup}\n      time_connect:  %{time_connect}\n   time_appconnect:  %{time_appconnect}\n  time_pretransfer:  %{time_pretransfer}\n     time_redirect:  %{time_redirect}\ntime_starttransfer:  %{time_starttransfer}\n                    ----------\n        time_total:  %{time_total}\n"'

# ----------- #
# keybindings #
# ----------- #
zle -N peco-history-selection
bindkey '^R' peco-history-selection

# ---------- #
# completion #
# ---------- #
autoload -Uz compinit && compinit
autoload -U +X bashcompinit && bashcompinit
zstyle ':completion:*:default' menu select interactive # 補完候補を矢印で選択できる
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'    # 補完で小文字でも大文字にマッチさせる
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}  # ファイルの補完で色付きにする
zstyle ':completion:*' ignore-parents parent pwd ..    # ../ の後は今いるディレクトリを補完しない
setopt menu_complete         # 補完開始直後に絞り込む
setopt nonomatch             # グロブ展開をオフ
setopt auto_param_slash      # ディレクトリ名の補完で末尾の / を自動的に付加し、次の補完に備える
setopt mark_dirs             # ファイル名の展開でディレクトリにマッチした場合 末尾に / を付加
setopt auto_menu             # 補完キー連打で順に補完候補を自動で補完

# -------- #
# settings #
# -------- #
setopt always_last_prompt    # カーソル位置は保持したままファイル名一覧を順次その場で表示
setopt print_eight_bit       # 日本語ファイル名を表示可能にする
setopt no_beep               # beep を無効にする
setopt ignore_eof            # Ctrl+Dでzshを終了しない
setopt interactive_comments  # '#' 以降をコメントとして扱う
setopt auto_cd               # ディレクトリ名だけでcdする
setopt auto_pushd            # cd したら自動的にpushdする
setopt pushd_ignore_dups     # 重複したディレクトリを追加しない
setopt share_history         # 同時に起動したzshの間でヒストリを共有する
setopt hist_ignore_all_dups  # 同じコマンドをヒストリに残さない
setopt hist_reduce_blanks    # ヒストリに保存するときに余分なスペースを削除する
setopt correct               # コマンドの打ち間違いを指摘してくれる
SPROMPT="correct: $RED%R$DEFAULT -> $GREEN%r$DEFAULT ? [Yes/No/Abort/Edit] => "

# -------- #
# vcs_info #
# -------- #
autoload -Uz vcs_info
zstyle ':vcs_info:*' formats '%F{cyan}(%b)%f'
zstyle ':vcs_info:*' actionformats '%F{red}(%s)-[%b|%a]%f'

autoload -Uz add-zsh-hook
_update_vcs_info_msg() {
  LANG=en_US.UTF-8 vcs_info
  RPROMPT="${vcs_info_msg_0_}"
}
add-zsh-hook precmd _update_vcs_info_msg

# ------ #
# prompt #
# ------ #
if [ "$(uname -s)" = "Darwin" ]; then
  PROMPT="%{${fg[green]}%}%n%{${fg[blue]}%}@%~  %{$fg[magenta]%}%D/%T
%{${reset_color}%}:) %{${fg[cyan]}%}$%{${reset_color}%} "
else
  PROMPT='%F{green}%n@%m%f:%F{blue}%~%f$ '
fi
