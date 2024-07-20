local Module = {
  {
    "williamboman/mason.nvim",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
    },
    opts = {}
  },

  {
    "nvimtools/none-ls.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "jay-babu/mason-null-ls.nvim",
      "nvimtools/none-ls-extras.nvim"
    },
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local null_ls = require "null-ls"
      local mason_null_ls = require "mason-null-ls"

      mason_null_ls.setup({
        automatic_installation = true,
        ensure_installed = {
          "eslint",
          "prettier",
        },
      })

      null_ls.setup {
        sources = {
          null_ls.builtins.code_actions.refactoring,
          null_ls.builtins.completion.spell,
          null_ls.builtins.formatting.prettier
        },
      }
    end
  },

  {
    "ray-x/lsp_signature.nvim",
    event = "VeryLazy",
    opts = {},
  },

  {
    "neovim/nvim-lspconfig",
    event = "BufReadPre",
    build = ":MasonUpdate",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "VonHeikemen/lsp-zero.nvim",

      -- dap
      "mfussenegger/nvim-dap",
      "nvim-telescope/telescope-dap.nvim"
    },
    config = function()
      local mason_lspconfig = require "mason-lspconfig"
      local lsp_zero = require 'lsp-zero'

      mason_lspconfig.setup {
        ensure_installed = { "rust_analyzer" },
        automatic_installation = true,
        handlers = {
          function(server_name)
            require('lspconfig')[server_name].setup({})
          end,
        },
      }


      local capabilities = vim.lsp.protocol.make_client_capabilities()
      local lsp = require "lspconfig"
      mason_lspconfig.setup_handlers({
        function(svr)
          lsp[svr].setup({
            capabilities = capabilities
          })
        end
      })


      lsp_zero.on_attach(
        function(_, bufnr)
          local keymap = vim.keymap
          local map_opt = { noremap = true, silent = true, buffer = bufnr }

          keymap.set("n", "<Leader>lf", "<CMD>lua vim.lsp.buf.format { async = true }<CR>", map_opt)
          keymap.set("v", "<Leader>lf", "<CMD>lua vim.lsp.buf.range_formatting()<CR>", map_opt)
          keymap.set("n", "<Leader>lr", "<CMD>lua require('telescope.builtin').lsp_references()<CR>", map_opt)
          keymap.set("n", "<Leader>ld", "<CMD>Lspsaga goto_definition<CR>", map_opt)
          keymap.set("n", "<Leader>lh", "<CMD>Lspsaga hover_doc<CR>", map_opt)
          keymap.set("n", "<Leader>ln", "<CMD>Lspsaga rename<CR>", map_opt)
          keymap.set("n", "<Leader>la", "<CMD>Lspsaga code_action<CR>", map_opt)
          keymap.set("n", "<Leader>le", "<CMD>lua vim.diagnostic.open_float()<CR>", map_opt)
          keymap.set("n", "<Leader>lo", "<CMD>Lspsaga outline<CR>", map_opt)
        end
      )
    end
  },

  {
    "pmizio/typescript-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    opts = {
      settings = {
        tsserver_locale = "zh-cn",
        expose_as_code_action = "all"
      }
    },
  }
}


return Module
