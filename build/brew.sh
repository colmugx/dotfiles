
if [ $(uname -s) != 'Darwin' ];then
  echo "Homebrew only on MacOS"
  exit 0
fi

echo "Now Installing Homebrew..."
echo "====================================="

if test ! $(which brew); then
  echo "Installing homebrew..."
  $(which ruby) -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

cd "$(brew --repo)"
git remote set-url origin https://mirrors.aliyun.com/homebrew/brew.git

cd "$(brew --repo)/Library/Taps/homebrew/homebrew-core"
git remote set-url origin https://mirrors.aliyun.com/homebrew/homebrew-core.git

brew update
brew upgrade

