local Module = {{
    "nvim-lualine/lualine.nvim",
    evnet = "VeryLazy",
    dependencies = "arkav/lualine-lsp-progress",
    config = function()
        require "third.evil_lualine"

        require("lualine").setup {
          extensions = { "nvim-tree" }
        }
    end
}}

return Module
