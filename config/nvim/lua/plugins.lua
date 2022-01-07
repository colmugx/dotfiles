vim.cmd [[packadd packer.nvim]]

function spec(use)
    use "wbthomason/packer.nvim"

    require("modules.theme").Setup(use)
    -- require("modules.lualine").Setup(use)
    -- require("modules.complete").Setup(use)
    -- require("modules.misc").Setup(use)
end

require("packer").startup({
    spec,
    config = {
        display = {
            open_fn = require('packer.util').float
        }
    }
})
