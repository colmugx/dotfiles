local Module = {}

function Module.Setup(use)

    use {
        "nvim-lualine/lualine.nvim",
        requires = {"arkav/lualine-lsp-progress", {
            "SmiteshP/nvim-gps",
            config = function()
                require("nvim-gps").setup {}
            end
        }},
        config = function()
            require "third.evil_lualine"
        end
    }

end

return Module
