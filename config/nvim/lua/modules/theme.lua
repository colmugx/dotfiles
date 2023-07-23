local Module = {{
    "joshdick/onedark.vim",
    config = function()
        vim.cmd [[autocmd ColorScheme * call onedark#set_highlight("Normal", { "fg": { "gui": "#ABB2BF", "cterm": "145", "cterm16": "7" }})]]
        vim.cmd [[colorscheme onedark]]
    end
}}

return Module
