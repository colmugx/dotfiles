local Module = {}

function Module.Setup(use)

    use {
        "mattn/emmet-vim",
        config = function()
            vim.api.nvim_set_keymap('i', '<C-e>', '<leader><BS><plug>(emmet-expand-abbr)', {})
        end
    }

end

return Module
