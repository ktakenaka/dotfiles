#!/usr/local/bin/zsh

DOT_FILES=(.zshrc .zprofile .zshenv .inputrc .vimrc .gvimrc .gitignore_global)

for file in ${DOT_FILES[@]}
do
   ln -s $HOME/dotfiles/$file $HOME/$file
done

rm -f $HOME/.atom/keymap.cson
ln keymap.cson $HOME/.atom/keymap.cson

rm -f $HOME/.ipython/profile_default/startup/default.py
ln -s $HOME/dotfiles/default.py $HOME/.ipython/profile_default/startup/default.py
jt -r
