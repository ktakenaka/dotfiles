# init.d template came from here https://github.com/fhd/init-script-template
sudo cp $HOME/dotfiles/ubuntu/xkeysnail/ktake_xkeysnail /etc/init.d/
sudo chown root /etc/init.d/ktake_xkeysnail
sudo chmod a+x /etc/init.d/ktake_xkeysnail

sudo mkdir /etc/xkeysnail
sudo cp $HOME/dotfiles/ubuntu/xkeysnail/config.py /etc/xkeysnail
