thefuck --alias | source
set -U fish_prompt_pwd_dir_length 0
set -gx EDITOR 'nvim'
source .dotfiles/config/fish/paths.fish

function fish_prompt --description 'Write out the prompt'
	set -l last_status $status
    echo
    # PWD
    set_color $fish_color_cwd
    echo -n (prompt_pwd)
    set_color normal

    __terlar_git_prompt
    __fish_hg_prompt
    echo

    if not test $last_status -eq 0
        set_color $fish_color_error
    end

    echo -n '➤ '
    set_color normal
end

function fish_greeting
  echo "
 ___  __ __  ___  ___  ___  ___  _ _  ___  ___
/ __>|  \  \| . \| . \| . || . \| | ||  _>|_ _|
\__ \|     ||  _/|   /| | || | || ' || <__ | |
<___/|_|_|_||_|  |_\_\`___'|___/`___'`___/ |_|
  "
end
