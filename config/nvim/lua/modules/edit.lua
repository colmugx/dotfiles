local Module = {
  {
    "ntpeters/vim-better-whitespace",
    setup = function()
      vim.g.better_whitespace_enabled = true
    end,
    keys = {
      { "<Leader><space><space>", "<CMD>StripWhitespace<CR>", desc = "Strip white space" }
    }
  },

  {
    'b3nj5m1n/kommentary',
    event = "VeryLazy",
    config = function()
      require('kommentary.config').configure_language("default", {
        prefer_single_line_comments = true
      })

      vim.api.nvim_set_keymap("n", "<Leader>c<space>", "<Plug>kommentary_line_default", {})
      vim.api.nvim_set_keymap("v", "<Leader>c<space>", "<Plug>kommentary_visual_default<C-c>", {})
    end
  },

  {
    "tpope/vim-surround",
    event = 'BufRead',
  },

  {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {},
    keys = {
      { "<leader><space>f", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
    },
  },

  "hotoo/pangu.vim",

  'mg979/vim-visual-multi',

  {
    'Wansmer/symbol-usage.nvim',
    event = 'BufReadPre',
    opts = {},
  },

  {
    'sontungexpt/better-diagnostic-virtual-text',
    event = "LspAttach",
    opts = {}
  },

  {
    "rachartier/tiny-code-action.nvim",
    dependencies = {
      { "nvim-lua/plenary.nvim" },
      { "nvim-telescope/telescope.nvim" },
    },
    event = "LspAttach",
    opts = {},
  },

}

return Module
