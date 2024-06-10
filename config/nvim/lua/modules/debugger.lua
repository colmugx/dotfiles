local Module = {
  {
    "rcarriga/nvim-dap-ui",
    dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio", "theHamsta/nvim-dap-virtual-text" },
    config = function()
      require('dapui').setup()
      require('nvim-dap-virtual-text').setup()
    end
  },
  "Pocco81/dap-buddy.nvim"
}

return Module
