local Module = {}

function Module.Setup(use)

    use {
        "williamboman/nvim-lsp-installer",
        requires = {"neovim/nvim-lspconfig", "ray-x/lsp_signature.nvim", "hrsh7th/cmp-nvim-lsp", "folke/neodev.nvim", "SmiteshP/nvim-navic"},
        config = function()
            local buf_map = vim.api.nvim_buf_set_keymap
            local map_opt = {
                noremap = true,
                silent = true
            }

            local lsp_installer = require "nvim-lsp-installer"
            lsp_installer.on_server_ready(function(server)
                local opts = {

                    on_attach = function(client, bufnr)
                        if client.server_capabilities.documentSymbolProvider then
                            require("nvim-navic").attach(client, bufnr)
                        end

                        require("lsp_signature").on_attach()

                        buf_map(bufnr, "n", "<Leader>lf", "<CMD>lua vim.lsp.buf.format { async = true }<CR>", map_opt)
                        buf_map(bufnr, "v", "<Leader>lf", "<CMD>lua vim.lsp.buf.range_formatting()<CR>", map_opt)
                        buf_map(bufnr, "n", "<Leader>lr", "<CMD>lua require('telescope.builtin').lsp_references()<CR>",
                            map_opt)
                        buf_map(bufnr, "n", "<Leader>ld", "<CMD>lua require('telescope.builtin').lsp_definitions()<CR>",
                            map_opt)
                        buf_map(bufnr, "n", "<Leader>lh", "<CMD>lua vim.lsp.buf.hover()<CR>", map_opt)
                        buf_map(bufnr, "n", "<Leader>ln", "<CMD>lua vim.lsp.buf.rename()<CR>", map_opt)
                        buf_map(bufnr, "n", "<Leader>la", "<CMD>lua vim.lsp.buf.code_action()<CR>", map_opt)

                        buf_map(bufnr, "n", "<Leader>af", "<CMD>EslintFixAll<CR>", map_opt)

                    end,
                    capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
                }

                local servers = {
                    ["sumneko_lua"] = function()
                        return require("neodev").setup({
                            lspconfig = vim.tbl_deep_extend("force", opts, {
                                settings = {
                                    Lua = {
                                        diagnostics = {
                                            globals = {"vim"}
                                        }
                                    }
                                }
                            })
                        })
                    end
                }

                server:setup(servers[server.name] and servers[server.name]() or opts)
            end)
        end
    }

    use {
        "hrsh7th/nvim-cmp",
        requires = {"hrsh7th/cmp-nvim-lsp", "hrsh7th/cmp-buffer", "hrsh7th/cmp-path", "hrsh7th/cmp-cmdline",
                    "hrsh7th/cmp-vsnip", "hrsh7th/vim-vsnip", "rafamadriz/friendly-snippets"},
        config = function()
            local cmp = require "cmp"

            cmp.setup {
                snippet = {
                    expand = function(args)
                        vim.fn["vsnip#anonymous"](args.body)
                    end
                },
                mapping = {
                    ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), {"i", "c"}),
                    ["<C-e>"] = cmp.mapping({
                        i = cmp.mapping.abort(),
                        c = cmp.mapping.close()
                    }),

                    ["<C-n>"] = cmp.mapping.select_next_item(),
                    ["<Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.confirm({
                                select = true
                            })
                        elseif vim.fn["vsnip#available"](1) == 1 then
                            vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Plug>(vsnip-expand-or-jump)", true,
                                true, true), "", true)
                        else
                            fallback()
                        end
                    end, {"i", "s"})
                },

                sources = cmp.config.sources {
                    { name = "vsnip" },
                    { name = "nvim_lsp" },
                    { name = "path" },
                    { name = "buffer" }
                }
            }

            cmp.setup.cmdline("/", {
                mapping = cmp.mapping.preset.cmdline(),
                sources = {{
                    name = "buffer"
                }}
            })

            cmp.setup.cmdline(":", {
                mapping = cmp.mapping.preset.cmdline(),
                sources = cmp.config.sources {{
                    name = "path"
                }},
                {{
                    name = "cmdline"
                }}
            })

        end
    }

end

return Module
