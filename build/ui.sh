echo "Now Installing Homebrew cask..."
echo "====================================="

# install sketchybar
if brew list --cask sketchybar >/dev/null 2>&1; then
  echo "sketchybar already installed... skipping."
else
  brew install --cask sketchybar

  # install SbarLua
  git clone https://github.com/FelixKratz/SbarLua.git /tmp/SbarLua  --depth=1 && cd /tmp/SbarLua/ && make install && rm -rf /tmp/SbarLua/
fi
