echo "Now Installing Fonts..."
echo "=============================="

list=(
    font-jetbrains-mono-nerd-font
    font-maple
)

for item in "${list[@]}"; do
  if brew list --cask $item >/dev/null 2>&1; then
    echo "$item already installed... skipping"
  else
    brew install --cask $item
  fi
done
