local Module = {}

function Module.Setup(use)

    use {
        "nvim-lualine/lualine.nvim",
        requires = {"arkav/lualine-lsp-progress", {
            {
                "SmiteshP/nvim-gps",
                requires = "nvim-treesitter/nvim-treesitter"
            },
            config = function()
                require("nvim-gps").setup()
            end
        }},
        config = function()
            local evil_lualine = require "third.evil_lualine"

            require("lualine").setup {
                options = {
                    theme = evil_lualine
                }
            }
        end
    }

end

return Module
