source ~/.dotfiles/config/fish/paths.fish
source ~/.dotfiles/config/fish/mirrors.fish
source ~/.dotfiles/config/fish/aliases.fish

#conda
source ~/miniconda3/etc/fish/conf.d/conda.fish

thefuck --alias | source
set -U fish_prompt_pwd_dir_length 0
set -gx EDITOR 'nvim'

