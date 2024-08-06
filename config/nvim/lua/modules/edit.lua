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
      { "s",     mode = { "n", "x", "o" }, function() require("flash").jump() end,              desc = "Flash" },
      { "S",     mode = { "n", "x", "o" }, function() require("flash").treesitter() end,        desc = "Flash Treesitter" },
      { "r",     mode = "o",               function() require("flash").remote() end,            desc = "Remote Flash" },
      { "R",     mode = { "o", "x" },      function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
      { "<c-s>", mode = { "c" },           function() require("flash").toggle() end,            desc = "Toggle Flash Search" },
    },
  },

  "hotoo/pangu.vim",

  'mg979/vim-visual-multi',

}

return Module
