local Module = {{
    "nvim-treesitter/nvim-treesitter",
    event = "BufReadPost",
    run = ":TSUpdate",
    config = {
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
  }, {
    "nvim-telescope/telescope.nvim",
    dependencies = {"nvim-lua/plenary.nvim", "nvim-telescope/telescope-project.nvim"},
    config = function()
        require('telescope').setup {}

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
}, {
    "nvim-neo-tree/neo-tree.nvim",
    dependencies = {"nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons", "MunifTanjim/nui.nvim"},
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
    keys = {{
        "<Leader>ft",
        "<CMD>:Neotree toggle<CR>",
        desc = "NeoTree"
    }}
}}

return Module
