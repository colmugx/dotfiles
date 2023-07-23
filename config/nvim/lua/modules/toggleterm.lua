local Module = {
  "akinsho/toggleterm.nvim",
  event = "VeryLazy",
  config = {
    direction = "float"
  },
  keys = {
    { "<Leader>tt", "<CMD>ToggleTerm<CR>" }
  }

}

return Module
