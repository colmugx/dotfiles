call plug#begin('~/.vim/plugged')

  " global
  Plug 'ap/vim-css-color'
  Plug 'luochen1990/rainbow'
  Plug 'scrooloose/nerdtree'
  Plug 'ryanoasis/vim-devicons'
  Plug 'airblade/vim-gitgutter'
  Plug 'Xuyuanp/nerdtree-git-plugin'
  Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
  Plug 'rakr/vim-one'
  Plug 'vim-airline/vim-airline'

  " language
  Plug 'pangloss/vim-javascript'
  Plug 'maxmellon/vim-jsx-pretty'
  Plug 'othree/javascript-libraries-syntax.vim'
  Plug 'hail2u/vim-css3-syntax'
  Plug 'neovimhaskell/haskell-vim'

  " lint
  Plug 'w0rp/ale'

  " complete
  Plug 'ternjs/tern_for_vim'
  Plug 'mattn/emmet-vim'
  Plug 'ervandew/supertab'

  "snippets
  Plug 'VimSnippets/vim-snippets'
  Plug 'VimSnippets/vim-react-snippets'
  Plug 'heavenshell/vim-jsdoc', {'for': ['javascript', 'jsx', 'typescript']}

  " others
  Plug 'terryma/vim-multiple-cursors'
  Plug 'wakatime/vim-wakatime'
  Plug 'dyng/ctrlsf.vim'
  Plug 'majutsushi/tagbar'
  Plug 'Raimondi/delimitMate'
  Plug 'bronson/vim-trailing-whitespace'
  Plug 'alvan/vim-closetag'
call plug#end()

source ~/.vim/plugConf.vim

