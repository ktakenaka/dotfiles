# Fig pre block. Keep at the top of this file.
[[ -f "$HOME/.fig/shell/zprofile.pre.zsh" ]] && builtin source "$HOME/.fig/shell/zprofile.pre.zsh"

# ---- #
# path #
# ---- #
os=$(uname -s)
if [ "$os" = "Darwin" ]; then
  add_to_path_if_not_exists "/opt/homebrew/sbin"
  add_to_path_if_not_exists "/opt/homebrew/bin"
elif [ "$os" = "Linux" ]; then
  # No special paths for Linux at the moment
fi
add_to_path_if_not_exists "${KREW_ROOT:-$HOME/.krew}/bin"

# ---------- #
# completion #
# ---------- #
autoload -Uz compinit && compinit
zstyle ':completion:*:default' menu select interactive # 補完候補を矢印で選択できる
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'    # 補完で小文字でも大文字にマッチさせる
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}  # ファイルの補完で色付きにする
zstyle ':completion:*' ignore-parents parent pwd ..    # ../ の後は今いるディレクトリを補完しない
setopt menu_complete         # 補完開始直後に絞り込む
setopt nonomatch             # グロブ展開をオフ
setopt auto_param_slash      # ディレクトリ名の補完で末尾の / を自動的に付加し、次の補完に備える
setopt mark_dirs             # ファイル名の展開でディレクトリにマッチした場合 末尾に / を付加
setopt auto_menu             # 補完キー連打で順に補完候補を自動で補完

# ------- #
# setting #
# ------- #
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

autoload -U +X bashcompinit && bashcompinit

# --------------------- #
# environment variables #
# --------------------- #
export CLICOLOR=1
export LANG=ja_JP.UTF-8
export LC_ALL=en_US.UTF-8
export HISTFILE=${HOME}/.zsh_history # 履歴ファイルの保存先
export HISTSIZE=1000                 # メモリに保存される履歴の件数
export SAVEHIST=5000                 # 履歴ファイルに保存される履歴の件数

# ----- #
# alias #
# ----- #
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
alias curltime='curl -so /dev/nul -w "   time_namelookup:  %{time_namelookup}\n      time_connect:  %{time_connect}\n   time_appconnect:  %{time_appconnect}\n  time_pretransfer:  %{time_pretransfer}\n     time_redirect:  %{time_redirect}\ntime_starttransfer:  %{time_starttransfer}\n                    ----------\n        time_total:  %{time_total}\n"'

# Fig post block. Keep at the bottom of this file.
[[ -f "$HOME/.fig/shell/zprofile.post.zsh" ]] && builtin source "$HOME/.fig/shell/zprofile.post.zsh"
