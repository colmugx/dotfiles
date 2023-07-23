local Module = {
  {
    "rhysd/git-messenger.vim",
    config = function()
      vim.api.nvim_set_keymap("n", "<Leader>gm", "<CMD>GitMessenger<CR>", {
        noremap = true
      })
    end
  },
  {
    'tanvirtin/vgit.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('vgit').setup()
    end
  },
  {
    "NeogitOrg/neogit",
    cmd = "Neogit",
    dependencies = { "sindrets/diffview.nvim", "nvim-lua/plenary.nvim" },
    config = {
      kind = "split",
      integrations = {
        diffview = true
      }
    },
    keys = {
      { "<Leader>git", "<Cmd>Neogit<Cr>", desc = "Neogit" }
    }
  }
}

return Module
