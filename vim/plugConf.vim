" Settings
nnoremap <Leader>pi :PlugInstall<Cr>
nnoremap <Leader>pc :PlugClean<Cr>
nnoremap <Leader>pu :PlugUpdate<Cr>

" Color & Scheme
let g:airline_theme='one'
colorscheme one

let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1

" rainbow
let g:rainbow_active=1

" nerdtree
nnoremap <Leader>ft :NERDTree<Cr>

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


