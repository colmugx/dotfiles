-- install packer
local install_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    packer_bootstrap = vim.fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim',
                                  install_path})
end

vim.cmd [[packadd packer.nvim]]

local function spec(use)
    use "wbthomason/packer.nvim"

    -- display
    require("modules.theme").Setup(use)
    require("modules.lualine").Setup(use)
    require("modules.buffer").Setup(use)

    -- files
    require("modules.filetree").Setup(use)

    -- complete
    require("modules.complete").Setup(use)

    -- language
    require("modules.html").Setup(use)

    -- other
    require("modules.git").Setup(use)
    require("modules.misc").Setup(use)

    if packer_bootstrap then
        require('packer').sync()
    end
end

require("packer").startup({
    spec,
    config = {
        display = {
            open_fn = require('packer.util').float
        }
    }
})
