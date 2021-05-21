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

  $(which ruby) -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

cd "$(brew --repo)"
git remote set-url origin https://mirrors.ustc.edu.cn/brew.git

cd "$(brew --repo)/Library/Taps/homebrew/homebrew-core"
git remote set-url origin https://mirrors.ustc.edu.cn/homebrew-core.git

brew update
brew upgrade

echo "Now Installing Homebrew formula..."
echo "====================================="

list=(
    fish
    neovim
    tmux
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
    kitty
    hammerspoon
    squirrel
)

for cask in "${casks[@]}"; do
  if brew list --cask "$cask" >/dev/null 2>&1; then
    echo "$cask already installed... skipping."
  else
    brew install --cask $cask
  fi
done
