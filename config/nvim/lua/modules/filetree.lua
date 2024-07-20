local Module = { {
  "nvim-treesitter/nvim-treesitter",
  event = "BufReadPost",
  run = ":TSUpdate",
  config = {
    ensure_installed = "maintained",
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
    },
    autotag = {
      enable = true,
    },
    rainbow = {
      enable = true,
      extended_mode = true,
      max_file_lines = nil,
    },
  }
},
  {
    "nvim-neo-tree/neo-tree.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons", "MunifTanjim/nui.nvim" },
    config = {
      window = {
        mappings = {
          ["o"] = "open",
          ["s"] = "open_split",
          ["i"] = "open_vsplit",
          ["ma"] = "add",
          ["md"] = "delete",
          ["mm"] = "move",
          ["mc"] = "copy",
          ["mp"] = "paste_from_clipboard"
        }
      }
    },
    keys = {
      {
        "<Leader>ft",
        "<CMD>:Neotree toggle<CR>",
        desc = "NeoTree"
      }
    }
  }
}

return Module
