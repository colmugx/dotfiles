" Settings
nnoremap <Leader>pi :PlugInstall<Cr>
nnoremap <Leader>pc :PlugClean<Cr>
nnoremap <Leader>pu :PlugUpdate<Cr>

" Color & Scheme
let g:airline_theme='onedark'
colorscheme one

let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1

" rainbow
let g:rainbow_active=1

" nerdtree
nnoremap <Leader>ft :NERDTreeToggle<Cr>
let NERDTreeShowHidden=1

let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }

" ale
let g:ale_linter_aliases = {
  \ 'javascript.jsx': 'javascript',
  \ 'jsx': 'javascript'
  \ }
let g:ale_linters = {
  \ 'javascript': ['eslint']
  \ }
let g:ale_fixers = {
  \ 'javascript': ['eslint']
  \ }

" supertab
let g:SuperTabDefaultCompletionType = "<c-n>"

" tagbar
nnoremap <leader>tt :TagbarToggle<Cr>

" vim-trailing-whitespace
nmap <leader><space> :FixWhitespace<cr>

" jsdoc
nmap /** :JsDoc<CR>

" complete
let g:deoplete#enable_at_startup = 1
