local Module = {
  {
    "mrcjkb/rustaceanvim",
    version = "^3",
    ft = { "rust" },
    dependencies = {
      "neovim/nvim-lspconfig"
    }
  }
}

return Module
