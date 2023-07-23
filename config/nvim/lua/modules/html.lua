local Module = {{
    "mattn/emmet-vim",
    config = function()
        vim.api.nvim_set_keymap('i', '<C-e>', '<leader><BS><plug>(emmet-expand-abbr)', {})
    end
}}

return Module
