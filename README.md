# Finalize
```
bin/dump.sh
```

# initialize
```
xcode-select --install
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
/usr/local/bin/brew install zsh git
/usr/local/bin/git clone https://github.com/ktakenaka/dotfiles.git
```

then
```
chsh -s $(which zsh)
bin/add_permissions.sh
bin/setup_settings.sh
bin/install_dependencies.sh
```

## Atom
```
apm install --packages-file ./atom/packages.txt
```
