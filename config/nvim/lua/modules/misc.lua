local Module = {}

function Module.Setup(use)

    -- statistics
    use {"wakatime/vim-wakatime"}

    -- scroll
    use {
        "karb94/neoscroll.nvim",
        config = function()
            require("neoscroll").setup()
        end
    }

end

return Module
