" install plug.vim
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

call plug#begin('~/.vim/plugged')

  " Graphics
  Plug 'luochen1990/rainbow'
  Plug 'scrooloose/nerdcommenter'
  Plug 'ryanoasis/vim-devicons'
  Plug 'airblade/vim-gitgutter'
  Plug 'scrooloose/nerdtree'
  Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
  Plug 'joshdick/onedark.vim'
  Plug 'Yggdroot/indentLine'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'simeji/winresizer'
  Plug 'vim-scripts/BufOnly.vim'
  Plug 'hotoo/pangu.vim'
  Plug 'Yggdroot/indentLine'


  " Language
  "" Javascript
  Plug 'othree/javascript-libraries-syntax.vim'
  Plug 'pangloss/vim-javascript'
  Plug 'neoclide/vim-jsx-improve'
  Plug 'HerringtonDarkholme/yats.vim', { 'for': 'typescript' }
  Plug 'heavenshell/vim-jsdoc', { 'on': 'JsDoc' }

  "" CSS
  Plug 'ap/vim-css-color'
  Plug 'hail2u/vim-css3-syntax'

  "" Other
  Plug 'neovimhaskell/haskell-vim', { 'for': 'haskell' }
  Plug 'jparise/vim-graphql'
  Plug 'dag/vim-fish'
  Plug 'ElmCast/elm-vim'
  Plug 'cespare/vim-toml'


  " Lint
  Plug 'w0rp/ale'


  " Complete
  Plug 'mattn/emmet-vim'
  Plug 'ervandew/supertab'
  Plug 'neoclide/coc.nvim', { 'do': 'yarn install' }


  " Snippets
  Plug 'SirVer/ultisnips'
  Plug 'VimSnippets/vim-web-snippets'


  " Others
  Plug 'terryma/vim-multiple-cursors'
  Plug 'wakatime/vim-wakatime'
  Plug 'jiangmiao/auto-pairs'
  Plug 'tpope/vim-surround'
  Plug 'bronson/vim-trailing-whitespace'
  Plug 'easymotion/vim-easymotion'
  Plug 'alvan/vim-closetag'
  Plug 'editorconfig/editorconfig-vim'
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
  Plug 'easymotion/vim-easymotion'

  " text
  Plug 'jceb/vim-orgmode'
  Plug 'godlygeek/tabular'
  Plug 'plasticboy/vim-markdown'
  Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install' }
  call plug#end()

source ~/.vim/plugConf.vim

