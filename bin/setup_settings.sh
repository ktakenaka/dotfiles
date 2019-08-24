echo 'Create symlinks'
DIRS=(iterm terminal vim zsh)
DOT_HOME=$HOME/dotfiles
for dir in ${DIRS[@]}
do
  echo "--- $dir ---"
  for f in $(ls -A $DOT_HOME/$dir)
  do
    echo $f
    ln -fs "$DOT_HOME/$dir/$f" $HOME/$f
  done
done

echo 'Setting for atom'
for f in $(ls -A $DOT_HOME/atom)
do
  echo $f
  ln -f $DOT_HOME/atom/$f $HOME/.atom/$f
done

echo 'Setting for python'
ln -sf $HOME/dotfiles/python/default.py $HOME/.ipython/profile_default/startup/default.py
