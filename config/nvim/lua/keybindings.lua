local map = vim.keymap.set
local opts = {
    noremap = true,
    silent = true,
}

-- increment / decrement
map('n', '+', '<C-a>', opts)
map('n', '-', '<C-x>', opts)

-- buffer
map('n', '<Leader>bd', '<cmd>bd<cr>', opts)

-- switch split
map('n', '<C-h>', '<C-w>h', opts)
map('n', '<C-j>', '<C-w>j', opts)
map('n', '<C-k>', '<C-w>k', opts)
map('n', '<C-l>', '<C-w>l', opts)

-- edit
map('n', '<C-a>', 'ggVG', opts)
map('n', '<Leader>c', '<C-o>zz', opts)
map('n', '\\', '<cmd>noh<cr>', opts)

-- spell check
map('n', '<Leader>wr', 'z=', opts, { desc = "For the word under/after the cursor suggest correctly spelled words" })
map('n', '<Leader>wt', 'zg', opts, { desc = "Add word under the cursor as a good word" })
map('n', '<Leader>we', 'zw', opts, { desc = "Like \"zg\" but mark the word as a wrong (bad) word" })

-- navigate
map('n', '<Leader>bh', '<c-o>', opts, { desc = "Prev Buffer" })
map('n', '<Leader>bl', '<c-i>', opts, { desc = "Next Buffer" })
