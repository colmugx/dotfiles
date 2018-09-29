source .dotfiles/config/fish/paths.fish
source .dotfiles/config/fish/mirrors.fish

thefuck --alias | source
set -U fish_prompt_pwd_dir_length 0
set -gx EDITOR 'nvim'

