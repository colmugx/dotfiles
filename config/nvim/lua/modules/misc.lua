local Module = {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function()
      require("which-key").setup {}
    end
  },

  {
    "wakatime/vim-wakatime",
    event = "VeryLazy"
  },

  {
    "windwp/nvim-autopairs",
    event = "BufReadPre",
    config = function()
      require("nvim-autopairs").setup()
    end
  },

  {
    "folke/todo-comments.nvim",
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      require("todo-comments").setup {}
    end
  },

}

return Module
