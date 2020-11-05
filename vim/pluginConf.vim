" Settings
nnoremap <Leader>pi :PlugInstall<Cr>
nnoremap <Leader>pc :PlugClean<Cr>
nnoremap <Leader>pu :PlugUpdate<Cr>

" Color & Scheme
augroup color
        autocmd!
        let s:white = { "gui": "#ABB2BF", "cterm": "145", "cterm16": "7" }
        autocmd ColorScheme * call onedark#set_highlight("Normal", { "fg": s:white })
augroup END
let g:airline_theme='onedark'
set termguicolors
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


" defx
nnoremap <Leader>ft :Defx<Cr>
let g:defx_icons_enable_syntax_highlight = 1
call defx#custom#option('_', {
      \ 'winwidth': 30,
      \ 'split': 'vertical',
      \ 'direction': 'topleft',
      \ 'show_ignored_files': 1,
      \ 'buffer_name': '',
      \ 'toggle': 1,
      \ 'resume': 1,
      \ 'columns': 'git:mark:indent:icons:filename:type:size'
      \ })
function! s:defx_mappings() abort
  nnoremap <silent><buffer><expr> o defx#is_directory() ?  defx#do_action('open_or_close_tree') : defx#do_action('drop')
endfunction
augroup Defx
  autocmd BufWritePost * call defx#redraw()
  autocmd BufEnter * call defx#redraw()
  autocmd BufWritePost * setlocal cursorline
  autocmd BufEnter * setlocal cursorline
  autocmd FileType defx match ExtraWhitespace /^^/
  autocmd FileType defx call s:defx_mappings()
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

" markdown
let g:vim_markdown_conceal = 0
let g:vim_markdown_conceal_code_blocks = 0
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_toc_autofit = 1
let g:vim_markdown_math = 1
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_auto_extension_ext = 'md'

" python
let g:deoplete#sources#jedi#python_path = '/usr/local/bin/python3'
