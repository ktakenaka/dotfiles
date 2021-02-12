DOT_HOME=$HOME/dotfiles
UBUNTU_HOME=$HOME/dotfiles/ubuntu

# --- zsh ---
rsync -av $DOT_HOME/zsh/ $HOME/

# --- tmux ---
rsync -av $DOT_HOME/tmux/ $HOME/

# --- vim ---
rsync -av $DOT_HOME/vim/ $HOME/

# init.d template came from here https://github.com/fhd/init-script-template
sudo rsync $UBUNTU_HOME/xkeysnail/ktake_xkeysnail /etc/init.d/
sudo chown root /etc/init.d/ktake_xkeysnail
sudo chmod a+x /etc/init.d/ktake_xkeysnail

sudo mkdir -p /etc/xkeysnail
sudo rsync $UBUNTU_HOME/xkeysnail/config.py /etc/xkeysnail
