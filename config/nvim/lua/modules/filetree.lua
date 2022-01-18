local Module = {}

function Module.Setup(use)

    use {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
        config = function()
            require("nvim-treesitter.configs").setup {}
        end
    }

    use {
        "nvim-telescope/telescope.nvim",
        requires = {"nvim-lua/plenary.nvim", "nvim-telescope/telescope-project.nvim"},
        config = function()
            require('telescope').setup {}

            vim.api.nvim_set_keymap('n', '<Leader>bs', '<cmd>Telescope live_grep<cr>', {
                noremap = true
            })
            vim.api.nvim_set_keymap('n', '<Leader>bb', '<cmd>Telescope buffers<cr>', {
                noremap = true
            })
            vim.api.nvim_set_keymap('n', '<Leader>bf', '<cmd>Telescope find_files<cr>', {
                noremap = true
            })
        end
    }

    use {
        "kyazdani42/nvim-tree.lua",
        requires = {'kyazdani42/nvim-web-devicons'},
        config = function()
            local tree_cb = require'nvim-tree.config'.nvim_tree_callback
            require("nvim-tree").setup {
                view = {
                    mappings = {
                        list = {{
                            key = "i",
                            cb = tree_cb("split")
                        }}
                    }
                }
            }

            vim.api.nvim_set_keymap('n', '<Leader>ft', '<cmd>NvimTreeToggle<cr>', {
                noremap = true
            })
        end
    }

end

return Module
