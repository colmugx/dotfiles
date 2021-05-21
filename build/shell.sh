echo "Now Init Fish Shell..."
echo "====================================="

curl -L https://get.oh-my.fish | fish
echo /usr/local/bin/fish | sudo tee -a /etc/shells
chsh -s /usr/local/bin/fish