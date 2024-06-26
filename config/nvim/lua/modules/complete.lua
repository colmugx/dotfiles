local Module = { {
  "folke/trouble.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    use_diagnostic_signs = true
  },
  config = function()
    vim.keymap.set("n", "<leader>ct", "<cmd>TroubleToggle<cr>", {
      silent = true,
      noremap = true
    })
  end
}, {
  "hrsh7th/nvim-cmp",
  event = "BufReadPre",
  dependencies = { "hrsh7th/cmp-nvim-lsp", "hrsh7th/cmp-buffer", "hrsh7th/cmp-path", "hrsh7th/cmp-cmdline",
    "onsails/lspkind-nvim", "hrsh7th/cmp-vsnip", "hrsh7th/vim-vsnip", "rafamadriz/friendly-snippets",
    "f3fora/cmp-spell" },
  config = function()
    local cmp = require "cmp"
    local lspkind = require "lspkind"

    local symbol_map = {
      Text = "󰉿",
      Method = "󰆧",
      Function = "󰊕",
      Constructor = "",
      Field = "󰜢",
      Variable = "󰀫",
      Class = "󰠱",
      Interface = "",
      Module = "",
      Property = "󰜢",
      Unit = "󰑭",
      Value = "󰎠",
      Enum = "",
      Keyword = "󰌋",
      Snippet = "",
      Color = "󰏘",
      File = "󰈙",
      Reference = "󰈇",
      Folder = "󰉋",
      EnumMember = "",
      Constant = "󰏿",
      Struct = "󰙅",
      Event = "",
      Operator = "󰆕",
      TypeParameter = ""
    }

    cmp.setup {
      formatting = {
        format = lspkind.cmp_format {
          symbol_map = symbol_map
        }
      },
      snippet = {
        expand = function(args)
          vim.fn["vsnip#anonymous"](args.body)
        end
      },
      mapping = {
        ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
        ['<C-e>'] = cmp.mapping.abort(),
        ["<C-p>"] = cmp.mapping.select_prev_item(),
        ["<C-n>"] = cmp.mapping.select_next_item(),
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.confirm({
              select = true
            })
          elseif vim.fn["vsnip#available"](1) == 1 then
            vim.api.nvim_feedkeys(
              vim.api.nvim_replace_termcodes("<Plug>(vsnip-expand-or-jump)", true, true, true), "", true)
          else
            fallback()
          end
        end, { "i", "s" })
        -- ["<Enter>"] = cmp.mapping(function(fallback)
        --   if cmp.visible() then
        --     cmp.confirm({
        --       select = true
        --     })
        --   end
        -- end, { "i", "s" }),
      },

      sources = cmp.config.sources { {
        name = "vsnip"
      }, {
        name = "nvim_lsp",
        trigger_characters = { '.', ":" }
      }, {
        name = "path"
      }, {
        name = "spell"
      }, {
        name = "buffer"
      } }
    }

    cmp.setup.cmdline({ '/', '?' }, {
      mapping = cmp.mapping.preset.cmdline(),
      sources = { {
        name = "buffer"
      } }
    })

    cmp.setup.cmdline(':', {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({ {
        name = 'path'
      } }, { {
        name = 'cmdline'
      } })
    })
  end
}, {
  "williamboman/mason.nvim",
  dependencies = { {
    "williamboman/mason-lspconfig.nvim",
    opts = { {
      ensure_installed = { "tsserver", "lua_ls", "unocss", "rust_analyzer" },
      automatic_installation = true
    } },
    config = function()
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      local lsp = require "lspconfig"
      require("mason-lspconfig").setup_handlers({ function(svr)
        lsp[svr].setup({
          capabilities = capabilities
        })
      end })
    end

  }, {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = {}
  } },
  opts = {}
}, {
  "neovim/nvim-lspconfig",
  event = "BufReadPre",
  build = ":MasonUpdate",
  dependencies = { "hrsh7th/cmp-nvim-lsp", "williamboman/mason.nvim", "williamboman/mason-lspconfig.nvim",
    "ray-x/lsp_signature.nvim", "SmiteshP/nvim-navic", "nvimtools/none-ls.nvim",
    "jose-elias-alvarez/nvim-lsp-ts-utils", {
    "folke/neodev.nvim",
    ft = { "lua" }
  }, -- dap
    "mfussenegger/nvim-dap", "nvim-telescope/telescope-dap.nvim" },
  config = function()
    require("telescope").load_extension("dap")

    local map_opt = {
      noremap = true,
      silent = true
    }

    local lsp = require "lspconfig"

    local client_capabilites = vim.lsp.protocol.make_client_capabilities()
    lsp.util.default_config = vim.tbl_extend("force", lsp.util.default_config, {
      capabilities = require("cmp_nvim_lsp").default_capabilities(client_capabilites)
    })

    lsp.lua_ls.setup({
      ettings = {
        Lua = {
          completion = {
            callSnippet = "Replace"
          }
        }
      }
    })
    lsp.unocss.setup {}

    local null_ls = require "null-ls"
    null_ls.setup {
      sources = {                            -- null_ls.builtins.code_actions.eslint_d,
        null_ls.builtins.code_actions.refactoring, null_ls.builtins.completion.spell,
        null_ls.builtins.completion.vsnip,   -- null_ls.builtins.diagnostics.eslint_d,
        null_ls.builtins.formatting.prettier -- null_ls.builtins.formatting.eslint_d
      },

      on_attach = function(client, bufnr)
        local keymap = vim.keymap

        if client.server_capabilities.documentSymbolProvider then
          require("nvim-navic").attach(client, bufnr)
        end

        require("lsp_signature").on_attach()

        vim.diagnostic.config {
          visual_text = true
        }

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
    }
  end
}, {
  "nvimdev/lspsaga.nvim",
  dependenices = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' },
  event = "lspAttach",
  opts = {
    lightbulb = {
      sign = false
    }
  }
} }

return Module
