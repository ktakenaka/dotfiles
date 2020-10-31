conda list > ./python/conda-package-list.txt
cp ~/.config/karabiner/karabiner.json ./karabiner
cp -pR ~/.config/karabiner/assets/complex_modifications/* ./karabiner/complex_modifications
brew bundle dump
