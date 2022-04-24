local Module = {}

function Module.Setup(use)

    use {
        "leafOfTree/vim-svelte-plugin",
        config = function()
            vim.g.vim_svelte_plugin_use_typescript = 1
            vim.g.vim_svelte_plugin_use_foldexpr = 1
        end
    }

end

return Module
