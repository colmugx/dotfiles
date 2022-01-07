local Module = {}

function Module.Setup(use)

    use {
        "joshdick/onedark.vim",
        config = function()
            vim.cmd [[autocmd ColorScheme * call onedark#set_highlight("Normal", { "fg": { "gui": "#ABB2BF", "cterm": "145", "cterm16": "7" }})]]
            vim.cmd [[colorscheme onedark]]
        end
    }

end

return Module
