" Settings
nnoremap <Leader>pi :PlugInstall<Cr>
nnoremap <Leader>pc :PlugClean<Cr>
nnoremap <Leader>pu :PlugUpdate<Cr>

" Color & Scheme
let g:airline_theme='onedark'
colorscheme onedark

let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1

" rainbow
let g:rainbow_active=1

" indentLine
let g:indentLine_enabled = 1
let g:indentLine_color_gui = '#cccccc'
let g:indentLine_faster = 1

autocmd Filetype json let g:indentLine_setConceal = 0

" nerdtree
nnoremap <Leader>ft :NERDTreeToggle<Cr>
let NERDTreeShowHidden=1
augroup Nerdtree
  autocmd!
  autocmd bufenter * if (winnr('$') == 1 && exists('b:NERDTreeType') && b:NERDTreeType == 'primary') | q | endif
  autocmd StdinReadPre * let s:std_in=1
  autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
augroup END

" nerdcommenter
let g:NERDSpaceDelims=1
let g:NERDDefaultNesting = 1

" ale
let g:ale_linter_aliases = {
  \ 'javascript.jsx': 'javascript',
  \ 'jsx': 'javascript',
  \ 'react.typescript': 'typescript',
  \ }
let g:ale_linters = {
  \ 'javascript': ['eslint'],
  \ 'typescript': ['tslint'],
  \ 'scss': ['stylelint'],
  \ 'elm': ['elm-format'],
  \ }
let g:ale_fixers = {
  \ 'javascript': ['eslint'],
  \ 'typescript': ['prettier', 'tslint'],
  \ 'scss': ['prettier', 'stylelint'],
  \ 'elm': ['elm-format'],
  \ 'python': ['yapf'],
  \ 'rust': ['rustfmt']
  \ }
let g:ale_fix_on_save = 1
nmap <silent> <Leader>af <Plug>(ale_fix)

" supertab
let g:SuperTabDefaultCompletionType = "<c-n>"

" tagbar
nnoremap <leader>tt :TagbarToggle<Cr>

" vim-trailing-whitespace
nmap <silent> <leader><space><space> :FixWhitespace<cr>
augroup TrailingSpace
  autocmd!
  autocmd BufWritePre * FixWhitespace
augroup END

" jsdoc
let g:jsdoc_enable_es6 = 1
imap /** :JsDoc<CR>

" javascript
let javascript_enable_domhtmlcss = 1
let g:javascript_plugin_jsdoc = 1

" javascript-libraries-syntax
let g:used_javascript_libs = 'underscore,jquery,react'

" emmet
imap <silent> <C-e> <Space><BS><plug>(emmet-expand-abbr)
let g:user_emmet_settings = {
  \ 'javascript.jsx' : {
  \   'extends' : 'jsx',
  \  },
  \ }

" ultisnips
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

" coc
nnoremap <silent> <leader>lh <Plug>(coc-references)
nnoremap <silent> <leader>ld <Plug>(coc-definition)
nnoremap <silent> <leader>ltd <Plug>(coc-type-definition)
nnoremap <silent> <leader>lr <Plug>(coc-rename)

call coc#add_extension(
  \ 'coc-tsserver',
  \ 'coc-json',
  \ 'coc-css',
  \ 'coc-word',
  \ 'coc-prettier',
  \ 'coc-eslint',
  \ 'coc-rls',
  \ )

" autocmd(plugin)
autocmd BufRead,BufNewFile *.tsx setlocal filetype=react.typescript
autocmd BufRead,BufNewFile *.jsx setlocal filetype=javascript.jsx
autocmd BufRead,BufNewFile *.styl setlocal filetype=stylus.css

" closetag
let g:closetag_filenames = '*.html,*.xhtml,*.xml,*.js,*.jsx,*.html.erb,*.md,*.vue'

" vim-surround
nmap <silent> ,, ysiw
nmap <silent> ,. cs

" fzf
nnoremap <silent> <leader>bb :Buffers<Cr>
nnoremap <silent> <leader>bf :Files<Cr>

" winresizer
let g:winresizer_start_key = '<Leader>r'

" pangu
autocmd BufWritePre *.markdown,*.md,*.text,*.txt,*.wiki,*.cnx call PanGuSpacing()

" python
let g:deoplete#sources#jedi#python_path = '/usr/local/bin/python3'
