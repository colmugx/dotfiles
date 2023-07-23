local Module = {{
    "lewis6991/gitsigns.nvim",
    event = "BufReadPre",
    dependencies = {"nvim-lua/plenary.nvim"},
    config = function()
        require("gitsigns").setup {
            current_line_blame = true
        }
    end
}, {
    "rhysd/git-messenger.vim",
    config = function()
        vim.api.nvim_set_keymap("n", "<Leader>gm", "<CMD>GitMessenger<CR>", {
            noremap = true
        })
    end
}, {
    'tanvirtin/vgit.nvim',
    dependencies = {'nvim-lua/plenary.nvim'},
    config = function()
        require('vgit').setup()
    end
}, {
    "NeogitOrg/neogitneogit",
    cmd = "Neogit",
    dependencies = {"sindrets/diffview.nvim", "nvim-lua/plenary.nvim"},
    config = {
        kind = "split",
        integrations = {
            diffview = true
        }
    }
}}

return Module
