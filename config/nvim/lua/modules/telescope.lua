local Module = {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-project.nvim",
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
      },
      {
        "folke/trouble.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = {
          use_diagnostic_signs = true
        },
        config = function()
          vim.keymap.set("n", "<leader>ct", "<cmd>TroubleToggle<cr>", {
            silent = true,
            noremap = true
          })
        end
      },
    },
    config = function()
      local telescope = require'telescope'

      telescope.setup {}
      telescope.load_extension('fzf')

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
  },
}

return Module
