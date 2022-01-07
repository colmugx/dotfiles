local Module = {}

function Module.Setup(use)

    use {
        "hrsh7th/nvim-cmp",
        requires = {"hrsh7th/cmp-nvim-lsp", "hrsh7th/cmp-buffer", "hrsh7th/cmp-path", "hrsh7th/cmp-cmdline",
                    "L3MON4D3/LuaSnip"},
        config = function()
            local cmp = require "cmp"

            cmp.setup {
                sources = {{
                    name = "nvim_lsp"
                }, {
                    name = "luasnip"
                }, {
                    name = "buffer"
                }, {
                    name = "path"
                }}
            }
        end
    }

end

return Module
