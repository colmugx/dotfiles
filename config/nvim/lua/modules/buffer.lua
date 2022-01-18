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
            vim.api.nvim_set_keymap('n', '<Leader>bx', '<cmd>BufOnly<cr>', {
                noremap = true,
                silent = true
            })
        end
    }

end

return Module
