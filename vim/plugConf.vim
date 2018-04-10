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
  \ 'javascript': ['eslint'],
  \ 'typescript': ['tslint']
  \ }
let g:ale_fixers = {
  \ 'javascript': ['eslint'],
  \ 'typescript': ['tslint']
  \ }
let g:ale_fix_on_save = 1
nmap <silent> <Leader>f <Plug>(ale_fix)

" supertab
let g:SuperTabDefaultCompletionType = "<c-n>"

" tagbar
nnoremap <leader>tt :TagbarToggle<Cr>

" vim-trailing-whitespace
nmap <leader><space> :FixWhitespace<cr>

" jsdoc
nmap /** :JsDoc<CR>

" emmet
imap <C-e> <Space><BS><plug>(emmet-expand-abbr)
let g:user_emmet_settings = {
  \ 'javascript.jsx' : {
  \   'extends' : 'jsx',
  \  },
  \ }

" ultisnips
let g:UltiSnipsJumpForwardTrigger="<c-n>"
let g:UltiSnipsJumpBackwardTrigger="<c-m>"

" complete (deoplete)
let g:deoplete#enable_at_startup = 1
let g:deoplete#max_menu_width = 60
let g:deoplete#auto_completion_start_length = 1
let g:deoplete#sources#ternjs#types = 1

let g:tern#command = ["tern"]
let g:tern#arguments = ["--persistent"]

" complete (lsp)
let g:LanguageClient_serverCommands = {
  \ 'vue': ['vls'],
  \ 'vue.html.javascript.css': ['vls']
  \ }
nnoremap <leader>lh :call LanguageClient_textDocument_hover()<CR>
nnoremap <leader>ld :call LanguageClient_textDocument_definition()<CR>
nnoremap <leader>lr :call LanguageClient_textDocument_rename()<CR>

" autocmd(plugin)
autocmd BufRead,BufNewFile *.vue setlocal filetype=vue.html.javascript.css
autocmd BufRead,BufNewFile *.tsx setlocal filetype=typescript.tsx
autocmd BufRead,BufNewFile *.jsx setlocal filetype=javascript.jsx
autocmd BufRead,BufNewFile *.styl setlocal filetype=stylus.css

" javascript
let javascript_enable_domhtmlcss = 1

" jsx-pretty
let g:vim_jsx_pretty_enable_jsx_highlight = 1
let g:vim_jsx_pretty_colorful_config = 1

" closetag
let g:closetag_filenames = '*.html,*.xhtml,*.xml,*.js,*.jsx,*.html.erb,*.md,*.vue'

" nerdcommenter
let g:NERDSpaceDelims=1
let g:NERDDefaultNesting = 1
let g:NERDCustomDelimiters = {
  \ 'clojure': {
    \ 'left': ';;'
  \ }
\ }

" vim-surround
nmap <silent> ,, ysiw
nmap <silent> ,. yssb

" fzf
nnoremap <leader>bw :Windows<Cr>
nnoremap <leader>bb :Buffers<Cr>
nnoremap <leader>bf :Files<Cr>
