DOTFILES=$HOME/.dotfiles

echo "Now Installing Vim..."

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