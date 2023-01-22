local Module = {}

function Module.Setup(use)

    use {
        "lewis6991/gitsigns.nvim",
        requires = {"nvim-lua/plenary.nvim"},
        config = function()
            require("gitsigns").setup {
              current_line_blame = true
            }
        end
    }

    use {
        "rhysd/git-messenger.vim",
        config = function()
            vim.api.nvim_set_keymap("n", "<Leader>gm", "<CMD>GitMessenger<CR>", {
                noremap = true
            })
        end
    }

    use {
        'tanvirtin/vgit.nvim',
        requires = {
          'nvim-lua/plenary.nvim'
        },
        config = function()
            require('vgit').setup()
        end
    }

end

return Module
