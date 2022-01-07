local Module = {}

function Module.Setup(use)

    use {
        "nvim-telescope/telescope.nvim",
        requires = {"nvim-lua/plenary.nvim", "nvim-telescope/telescope-project.nvim"},
        config = function()
            require("modules.telescope").setup()
        end
    }

end

return Module
