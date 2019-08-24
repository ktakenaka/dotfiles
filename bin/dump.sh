apm list --installed --bare > ./atom/packages.txt
conda list > ./python/conda-package-list.txt
cp ~/.config/karabiner/karabiner.json ./karabiner
cp -pR ~/.config/karabiner/assets/complex_modifications/* ./karabiner/complex_modifications
cp `ls -F ~/.atom | grep -v /` ./atom
brew bundle dump
