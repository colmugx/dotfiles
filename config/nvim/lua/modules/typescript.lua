local Module = {
  {
    "pmizio/typescript-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    opts = {},
    setup = function()
      require("typescript-tools").setup {
        settings = {
          tsserver_locale = "zh-cn",
          expose_as_code_action = "all"
        }
      }
    end
  }
}

return Module
