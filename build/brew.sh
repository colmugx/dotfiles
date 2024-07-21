if [ $(uname -s) != 'Darwin' ];then
  echo "Homebrew only on MacOS"
  exit 0
fi

echo "Now Installing Homebrew..."
echo "====================================="

if test ! $(which brew); then
  echo "Installing homebrew..."
  export HOMEBREW_BREW_GIT_REMOTE="https://mirrors.ustc.edu.cn/brew.git"
  export HOMEBREW_CORE_GIT_REMOTE="https://mirrors.ustc.edu.cn/homebrew-core.git"
  export HOMEBREW_BOTTLE_DOMAIN="https://mirrors.ustc.edu.cn/homebrew-bottles"
  export HOMEBREW_API_DOMAIN="https://mirrors.ustc.edu.cn/homebrew-bottles/api"

  /bin/bash -c "$(curl -fsSL https://github.com/Homebrew/install/raw/HEAD/install.sh)"
fi

brew update
brew upgrade

echo "Now Installing Homebrew formula..."
echo "====================================="

list=(
    fish
    neovim
    zellij
    ripgrep
)

for item in "${list[@]}"; do
  if brew list "$item" >/dev/null 2>&1; then
    echo "$item already installed... skipping."
  else
    brew install $item
  fi
done

echo "Now Installing Homebrew cask..."
echo "====================================="

casks=(
    iina
    devtoys
    raycast
    sf-symbols
    wezterm
    podman-desktop
    hammerspoon
    squirrel
    visual-studio-code
)

for cask in "${casks[@]}"; do
  if brew list --cask "$cask" >/dev/null 2>&1; then
    echo "$cask already installed... skipping."
  else
    brew install --cask $cask
  fi
done
