augroup Config
  autocmd!

  autocmd Filetype json let g:indentLine_setConceal = 0
  autocmd FileType markdown highlight htmlH1 cterm=none ctermfg=204
  autocmd BufNewFile,BufRead *.md set filetype=markdown

  autocmd BufRead,BufNewFile *.tsx setlocal filetype=react.typescript
  autocmd BufRead,BufNewFile *.jsx setlocal filetype=javascript.jsx
  autocmd BufRead,BufNewFile *.styl setlocal filetype=stylus.css

  " pangu
  autocmd BufWritePre *.markdown,*.md,*.text,*.txt,*.wiki,*.cnx call PanGuSpacing()
augroup END

