local Module = {
  {
    "supermaven-inc/supermaven-nvim",
    event = 'BufEnter',
    opts = {
      keymaps = {
        accept_suggestion = "<Tab>",
        clear_suggestion = "<C-]>",
        accept_word = "<C-j>",
      },
    }
  },
}

return Module
