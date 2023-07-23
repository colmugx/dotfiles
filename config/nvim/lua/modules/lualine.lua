local Module = {{
    "nvim-lualine/lualine.nvim",
    dependencies = "arkav/lualine-lsp-progress",
    config = function()
        require "third.evil_lualine"
    end
}}

return Module
