local Module = {
  {
    'akinsho/bufferline.nvim',
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
      require("bufferline").setup {
        options = {
          diagnostics = "nvim_lsp",
          hover = {
            enabled = true,
            delay = 200,
            reveal = { "close" }
          }
        },
      }
    end
  },
  {
    "numtostr/BufOnly.nvim",
    event = "VeryLazy",
    cmd = "BufOnly",
    config = function()
      vim.api.nvim_set_keymap('n', '<Leader>bx', '<cmd>BufOnly<cr>', {
        noremap = true,
        silent = true
      })
    end
  }
}

return Module
