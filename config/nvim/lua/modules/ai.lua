local Module = {
  -- {
  --   "supermaven-inc/supermaven-nvim",
  --   event = 'BufEnter',
  --   opts = {
  --     keymaps = {
  --       accept_suggestion = "<Tab>",
  --       clear_suggestion = "<C-]>",
  --       accept_word = "<C-j>",
  --     },
  --   }
  -- },
  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    build = "make",
    -- build = "make BUILD_FROM_SOURCE=true",
    opts = {
      provider = "gemini",
      behaviour = {
        auto_suggestions = false,
      },
    },
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      {
        'MeanderingProgrammer/render-markdown.nvim',
        opts = {
          file_types = { "markdown", "Avante" },
        },
        ft = { "markdown", "Avante" },
      },
    },
  }
}

return Module
