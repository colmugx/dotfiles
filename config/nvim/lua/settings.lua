local g = vim.g
local conf = vim.o

conf.number = true
conf.relativenumber = true

vim.cmd [[syntax on]]

-- line
conf.cursorline = true
conf.linebreak = true
conf.smartcase = true

-- font
conf.encoding = "utf-8"
conf.fileencodings = "utf-8,gbk,gb2312"

-- style
conf.shiftwidth = 2
conf.tabstop = 2
conf.smarttab = true
conf.expandtab = true
conf.backspace = "indent,eol,start"
conf.autoindent = true
conf.conceallevel = 0

-- shortcuts
conf.mouse = "a"

g.mapleader = "<space>"
