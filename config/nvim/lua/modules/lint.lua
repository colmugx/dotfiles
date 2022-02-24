local Module = {}

function Module.Setup(use)

    use {
        "dense-analysis/ale",
        setup = function()
            vim.g.ale_linters = {
                javascript = {'eslint'},
                typescript = {'eslint'}
            }

            vim.g.ale_fixers = {
                javascript = {'eslint'},
                typescript = {'prettier', 'eslint'}
            }
        end,
        config = function()
          vim.api.nvim_set_keymap('n', '<leader>af', '<Plug>(ale_fix)', {
            noremap = true
        })
        end
    }

end

return Module
