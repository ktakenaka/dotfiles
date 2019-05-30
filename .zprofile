alias ls='ls -G -F'
alias la='ls -a'
alias ll='ls -l'
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
alias chrome="open /Applications/Google\ Chrome.app"
export CLICOLOR=1

##################################
export PATH=/usr/local/opt/openssl/bin:/usr/local/opt/mysql@5.7/bin:/usr/local/opt/node@8/bin:/usr/local/opt/rabbitmq/sbin:$HOME/miniconda3/bin:$HOME/.rbenv/bin:$HOME/.rbenv/shim:$PATH
export DYLD_LIBRARY_PATH=/usr/local/opt/mysql@5.5/:${DYLD_LIBRARY_PATH}
export JAVA_HOME=`/usr/libexec/java_home -v 1.8`
export LANG=ja_JP.UTF-8
export LC_ALL=en_US.UTF-8
export LDFLAGS="-L/usr/local/opt/mysql@5.7/lib"
export CPPFLAGS="-I/usr/local/opt/mysql@5.7/include"

echo 'i am zprofile'
