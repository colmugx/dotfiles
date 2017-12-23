" number
set number
set relativenumber

" syntax
syntax on
syntax enable

" font
set encoding=utf-8
set fileencodings=utf-8,gbk,gb2312
set guifont=Menlo_Regular_for_Powerline_Nerd_Font_Complete

" style
set background=dark

" filetype
filetype plugin on
filetype indent on

if has('gui_macvim')
  set guioptions-=r
endif
