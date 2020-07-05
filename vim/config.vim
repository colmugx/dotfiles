" number
set number
set relativenumber

" syntax
syntax on
syntax enable

" line
set cursorline
set linebreak

" font
set encoding=utf-8
set fileencodings=utf-8,gbk,gb2312

" style
set background=dark
set shiftwidth=2
set tabstop=2
set smarttab
set expandtab
set backspace=2
set autoindent

" filetype
filetype plugin on
filetype indent on

" shortcuts
set mouse=a

" gui
if has('gui_macvim')
  set guioptions-=r
  set guifont=Menlo_Regular_for_Powerline_Nerd_Font_Complete
endif

