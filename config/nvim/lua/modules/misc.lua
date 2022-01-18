local Module = {}

function Module.Setup(use)

    use {
        "folke/which-key.nvim",
        config = function()
          require("which-key").setup {}
        end
      }

    -- statistics
    use {"wakatime/vim-wakatime"}

    -- scroll
    use {
        "karb94/neoscroll.nvim",
        config = function()
            require("neoscroll").setup()
        end
    }

    -- autopair
    use {
        "windwp/nvim-autopairs",
        config = function()
            require("nvim-autopairs").setup()
        end
    }

    use {
        "lukas-reineke/indent-blankline.nvim",
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
    }

    use {
        "simeji/winresizer",
        config = function()
            vim.g.winresizer_start_key = '<Leader>r'
        end
    }

    use {
        "ntpeters/vim-better-whitespace",
        setup = function()
            vim.g.better_whitespace_enabled = true
        end
    }

    use {
        'b3nj5m1n/kommentary',
        config = function()
            require('kommentary.config').configure_language("default", {
                prefer_single_line_comments = true,
            })

            vim.api.nvim_set_keymap("n", "<Leader>c<space>", "<Plug>kommentary_line_default", {})
            vim.api.nvim_set_keymap("v", "<Leader>c<space>", "<Plug>kommentary_visual_default<C-c>", {})
        end
    }

    use {"hotoo/pangu.vim", "tpope/vim-surround"}

end

return Module
