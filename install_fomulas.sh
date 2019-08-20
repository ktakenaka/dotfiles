xcode-select --install
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
/usr/local/bin/brew install zsh
/usr/local/bin/brew install Caskroom/cask/miniconda
/usr/local/bin/brew bundle

sh setup.sh
for f in $(find ./zsh -type f)
do
  source $f
done
