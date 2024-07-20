local g = vim.g
local o = vim.o

vim.cmd [[syntax on]]

o.number = true
o.relativenumber = true

-- preference
o.termguicolors = true

-- line
o.cursorline    = true
o.linebreak     = true
o.smartcase     = true

-- encoding
o.encoding      = "utf-8"
o.fileencodings = "utf-8,gbk,gb2312,gb18030"

-- style
o.shiftwidth    = 2
o.tabstop       = 2
o.smarttab      = true
o.expandtab     = true
o.backspace     = "indent,eol,start"
o.autoindent    = true
o.conceallevel  = 0

-- fold
o.foldmethod = "expr"
o.foldenable = true

-- shortcuts
o.mouse         = "a"

-- spell check
o.spelloptions  = "camel"
o.spelllang     = "en_gb,cjk"
o.spell         = true
g.mapleader     = " "
