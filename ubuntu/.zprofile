# this command is needed to enable /etc/init.d/ktake_xkeysnail.
# It will raise `Can't connect to display ":0"` error without this command.
xhost + > /dev/null
alias kymap="sudo /etc/init.d/ktake_xkeymap start"

if [ -x "`which go`" ]; then
  export GOPATH=$HOME/go
  export PATH="$GOPATH/bin:$PATH"
fi
