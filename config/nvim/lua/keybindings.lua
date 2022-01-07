local map = vim.api.nvim_set_keymap
local opts = {
    noremap = true,
    silent = false
}

-- buffer
map('n', '<leader>bd', ':bd', opts)
map('n', '<leader>bo', ':Bo', opts)

-- switch split
map('n', '<C-h>', '<C-w>h', opts)
map('n', '<C-j>', '<C-w>j', opts)
map('n', '<C-k>', '<C-w>k', opts)
map('n', '<C-l>', '<C-w>l', opts)

-- edit
map('n', '<C-a>', 'ggVG', opts)
map('n', '<leader>c', '<C-o>zz', opts)
map('n', '\\', ':noh<CR>', opts)
