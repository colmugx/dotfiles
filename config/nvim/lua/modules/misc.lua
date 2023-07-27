local Module = {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function()
      require("which-key").setup {}
    end
  },
  {
    "wakatime/vim-wakatime",
    event = "VeryLazy"
  },
  {
    "karb94/neoscroll.nvim",
    event = "VeryLazy",
    config = function()
      require("neoscroll").setup()
    end
  },
  {
    "windwp/nvim-autopairs",
    event = "BufReadPre",
    config = function()
      require("nvim-autopairs").setup()
    end
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    event = "BufReadPre",
    setup = function()
      vim.opt.list = true
      vim.opt.listchars:append("space:⋅")
      vim.g.indent_blankline_use_treesitter = true
      vim.g.indent_blankline_filetype_exclude = { "help", "packer" }
    end,
    config = function()
      require("indent_blankline").setup({
        show_current_context = true,
        show_current_context_start = false,
        space_char_blankline = " "
      })
    end
  },
  {
    "simeji/winresizer",
    event = "VeryLazy",
    config = function()
      vim.g.winresizer_start_key = '<Leader>r'
    end
  },
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
    "phaazon/hop.nvim",
    config = function()
      vim.api.nvim_set_keymap("n", "<Leader><space>f", "<cmd>HopChar1<cr>", {})
    end
  },
  'mg979/vim-visual-multi',
  {
    "SmiteshP/nvim-navic",
    requires = "neovim/nvim-lspconfig",
    config = function()
      require("nvim-navic").setup {
        icons = {
          File = " ",
          Module = " ",
          Namespace = " ",
          Package = " ",
          Class = " ",
          Method = " ",
          Property = " ",
          Field = " ",
          Constructor = " ",
          Enum = "練",
          Interface = "練",
          Function = " ",
          Variable = " ",
          Constant = " ",
          String = " ",
          Number = " ",
          Boolean = "◩ ",
          Array = " ",
          Object = " ",
          Key = " ",
          Null = "ﳠ ",
          EnumMember = " ",
          Struct = " ",
          Event = " ",
          Operator = " ",
          TypeParameter = " "
        },
        highlight = false,
        separator = " > ",
        depth_limit = 0,
        depth_limit_indicator = "..",
        safe_output = true
      }
    end
  },
  {
    "folke/todo-comments.nvim",
    requires = "nvim-lua/plenary.nvim",
    config = function()
      require("todo-comments").setup {}
    end
  },
  "hotoo/pangu.vim",
  "tpope/vim-surround"
}

return Module
