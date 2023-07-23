local map = vim.api.nvim_set_keymap
local opts = {
    noremap = true,
    silent = false
}

-- increment / decrement
map('n', '+', '<C-a>', opts)
map('n', '-', '<C-x>', opts)

-- buffer
map('n', '<Leader>bd', '<cmd>bd<cr>', opts)
map('n', '<Leader>bo', '<cmd>Bo<cr>', opts)

-- switch split
map('n', '<C-h>', '<C-w>h', opts)
map('n', '<C-j>', '<C-w>j', opts)
map('n', '<C-k>', '<C-w>k', opts)
map('n', '<C-l>', '<C-w>l', opts)

-- edit
map('n', '<C-a>', 'ggVG', opts)
map('n', '<Leader>c', '<C-o>zz', opts)
map('n', '\\', '<cmd>noh<cr>', opts)
map('n', 'dw', 'vbd', opts)
