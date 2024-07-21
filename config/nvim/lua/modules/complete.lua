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
  TypeParameter = "",
  Copilot = "",
  Supermaven = "",
}

local Module = {
  {
    "hrsh7th/nvim-cmp",
    event = "BufReadPost",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "onsails/lspkind-nvim",
      "hrsh7th/cmp-vsnip",
      "hrsh7th/vim-vsnip",
      "rafamadriz/friendly-snippets",
      "f3fora/cmp-spell",
      -- copilot
      "supermaven-inc/supermaven-nvim",
    },
    config = function()
      local cmp = require "cmp"
      local lspkind = require "lspkind"

      cmp.setup {
        formatting = {
          format = lspkind.cmp_format {
            symbol_map = symbol_map,
            before = function(entry, vim_item)
              vim_item.kind = string.format("%s %s", symbol_map[vim_item.kind], vim_item.kind)
              vim_item.menu = ({
                buffer = "[Buffer]",
                nvim_lsp = "[LSP]",
                vsnip = "[Snip]",
                nvim_lua = "[Lua]",
                path = "[Path]",
                copilot = "[Copilot]",
              })[entry.source.name]
              return vim_item
            end
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
          ["<C-j>"] = cmp.mapping.select_prev_item(),
          ["<C-k>"] = cmp.mapping.select_next_item(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
          ["<Tab>"] = cmp.mapping(function(fallback)
            if vim.fn["vsnip#available"](1) == 1 then
              vim.api.nvim_feedkeys(
                vim.api.nvim_replace_termcodes("<Plug>(vsnip-expand-or-jump)", true, true, true), "",
                true
              )
            elseif cmp.visible() then
              cmp.confirm({
                select = true
              })
            else
              fallback()
            end
          end, { "i", "s", "c" })
        },

        sources = cmp.config.sources {
          {
            name = "supermaven"
          },
          {
            name = "vsnip"
          },
          {
            name = "path"
          },
          {
            name = "buffer"
          },
          {
            name = "nvim_lsp",
            trigger_characters = { '.', ":" }
          },
          {
            name = "spell"
          },
        },

        sorting = {
          priority_weight = 2,
          comparators = {
            cmp.config.compare.offset,
            cmp.config.compare.exact,
            cmp.config.compare.score,
            cmp.config.compare.recently_used,
            cmp.config.compare.locality,
            cmp.config.compare.kind,
            cmp.config.compare.sort_text,
            cmp.config.compare.length,
            cmp.config.compare.order,
          },
        },
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
  },

  {
    "nvimdev/lspsaga.nvim",
    dependenices = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' },
    event = "lspAttach",
    opts = {
      lightbulb = {
        sign = false
      }
    }
  },
}

return Module
