local Module = {}

function Module.Setup(use)

    use {{
        "lewis6991/gitsigns.nvim",
        requires = {"nvim-lua/plenary.nvim"},
        config = function()
            require("gitsigns").setup()
        end
    }, {
        "rhysd/git-messenger.vim",
        config = function()
            vim.api.nvim_set_keymap("n", "gm", "<CMD>GitMessenger<CR>", {
                noremap = true
            })
        end
    }}

end

return Module
