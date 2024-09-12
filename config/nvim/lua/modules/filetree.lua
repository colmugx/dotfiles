local Module = { {
  "nvim-treesitter/nvim-treesitter",
  event = "BufReadPost",
  run = ":TSUpdate",
  config = function()
    require 'nvim-treesitter.configs'.setup {
      ensure_installed = { 'astro', 'lua', 'typescript', 'javascript', 'tsx', 'markdown', 'markdown_inline' },
      highlight = {
        enable = true,
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
  end
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
