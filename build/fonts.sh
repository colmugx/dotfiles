echo "Now Installing Fonts..."
echo "=============================="

brew tap homebrew/cask-fonts

list=(
    font-fira-code-nerd-font
    font-jetbrains-mono-nerd-font
)

for item in "${list[@]}"; do
  if brew list --cask $item >/dev/null 2>&1; then
    echo "$item already installed... skipping"
  else
    brew install --cask $item
  fi
done
