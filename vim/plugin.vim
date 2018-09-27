" install plug.vim
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

call plug#begin('~/.vim/plugged')

  " global
  Plug 'luochen1990/rainbow'
  Plug 'scrooloose/nerdcommenter'
  Plug 'ryanoasis/vim-devicons'
  Plug 'airblade/vim-gitgutter'
  Plug 'scrooloose/nerdtree'
  Plug 'Xuyuanp/nerdtree-git-plugin'
  Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
  Plug 'colmugx/onedark.vim'
  Plug 'Yggdroot/indentLine'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'simeji/winresizer'
  Plug 'vim-scripts/BufOnly.vim'

  " language
  Plug 'othree/javascript-libraries-syntax.vim'
  Plug 'pangloss/vim-javascript'
  Plug 'maxmellon/vim-jsx-pretty'
  Plug 'hail2u/vim-css3-syntax'
  Plug 'neovimhaskell/haskell-vim', { 'for': 'haskell' }
  Plug 'ap/vim-css-color'
  Plug 'HerringtonDarkholme/yats.vim'
  Plug 'ElmCast/elm-vim'
  Plug 'wavded/vim-stylus'
  Plug 'dag/vim-fish'
  Plug 'rust-lang/rust.vim'

  " lint
  Plug 'w0rp/ale'
  Plug 'rhysd/vim-fixjson', { 'for': 'json' }

  " complete
  Plug 'ternjs/tern_for_vim'
  Plug 'mattn/emmet-vim'
  Plug 'ervandew/supertab'
  if has('nvim')
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  else
    Plug 'Shougo/deoplete.nvim'
    Plug 'roxma/nvim-yarp'
    Plug 'roxma/vim-hug-neovim-rpc'
  endif
  Plug 'eagletmt/neco-ghc', { 'for': 'haskell' }
  Plug 'carlitux/deoplete-ternjs'
  Plug 'zchee/deoplete-jedi', { 'for': 'python' }
  Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }


  "snippets
  Plug 'SirVer/ultisnips'
  Plug 'VimSnippets/vim-web-snippets'

  " others
  Plug 'csscomb/vim-csscomb'
  Plug 'terryma/vim-multiple-cursors'
  Plug 'wakatime/vim-wakatime'
  Plug 'dyng/ctrlsf.vim'
  Plug 'jiangmiao/auto-pairs'
  Plug 'thaerkh/vim-workspace'
  Plug 'tpope/vim-surround'
  Plug 'bronson/vim-trailing-whitespace'
  Plug 'easymotion/vim-easymotion'
  Plug 'alvan/vim-closetag'
  Plug 'editorconfig/editorconfig-vim'
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
  Plug 'heavenshell/vim-jsdoc', {'for': ['javascript', 'jsx', 'typescript']}
call plug#end()

source ~/.vim/plugConf.vim

