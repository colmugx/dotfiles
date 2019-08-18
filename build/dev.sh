DOTFILES=$HOME/.dotfiles

echo "Now Installing Develop Environment..."

echo "====================================="
echo -e "Configure tmux\n"
if [ -e $HOME/.tmux.conf ]; then
  echo "exist... Skipping"
else
  ln -s $DOTFILES/tmux/tmux.conf $HOME/.tmux.conf
fi

echo "====================================="
echo -e "Installing to ~/.config\n\n"
if [ ! -d $HOME/.config ]; then
  echo "Creating ~/.config"
  mkdir -p $HOME/.config
fi

for config in $DOTFILES/config/*; do
  filename="$(basename $config)"
  target="$HOME/.config/$filename"
  if [ -e $target ]; then
    echo "$target already exists... skipping."
  else
    echo "Creating symlink for $config"
    ln -s $config $target
  fi
done

echo "Creating vim symlinks"
echo "=============================="
VIMFILES=( "$HOME/.vim:$DOTFILES/vim"
           "$HOME/.vimrc:$DOTFILES/vim/init.vim")

for file in "${VIMFILES[@]}"; do
  KEY=${file%%:*}
  VALUE=${file#*:}
  if [ -e ${KEY} ]; then
    echo "${KEY} already exists... skipping."
  else
    echo "Creating symlink for $KEY"
    ln -s ${VALUE} ${KEY}
  fi
done

echo "Creating emacs symlink"
echo "=============================="

if [ ! -d $HOME/.emacs.d ]; then
  echo "Linking ~/.emacs.d"
  ln -s $DOTFILES/emacs $HOME/.emacs.d
else
  echo "already exists... skipping."
fi

