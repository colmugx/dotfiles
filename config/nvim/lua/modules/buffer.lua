local Module = {}

function Module.Setup(use)

    use {
        'akinsho/bufferline.nvim',
        requires = 'kyazdani42/nvim-web-devicons',
        config = function()
          require("bufferline").setup {}
        end
    }

    use {
        "numtostr/BufOnly.nvim",
        cmd = "BufOnly",
        config = function()
            vim.fn.nvim_set_keymap('n', '<leader>bx', ':BufOnly<CR>', {
                noremap = true,
                silent = true
            })
        end
    }

end

return Module
