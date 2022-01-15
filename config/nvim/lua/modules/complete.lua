local Module = {}

function Module.Setup(use)

    use {
        "williamboman/nvim-lsp-installer",
        requires = {"neovim/nvim-lspconfig", "ray-x/lsp_signature.nvim", "hrsh7th/cmp-nvim-lsp"},
        config = function()
            local buf_map = vim.api.nvim_buf_set_keymap
            local map_opt = {
                noremap = true,
                silent = true
            }

            local lsp_installer = require "nvim-lsp-installer"
            lsp_installer.on_server_ready(function(server)
                local opts = {
                    on_attach = function(_, bufnr)
                        require("lsp_signature").on_attach()

                        buf_map(bufnr, "n", "<Leader>lf", "<CMD>lua vim.lsp.buf.formatting()<CR>", map_opt)
                        buf_map(bufnr, "v", "<Leader>lf", "<CMD>lua vim.lsp.buf.range_formatting()<CR>", map_opt)
                        buf_map(bufnr, "n", "<Leader>lr", "<CMD>lua require('telescope.builtin').lsp_references()<CR>",
                            map_opt)
                        buf_map(bufnr, "n", "<Leader>ld", "<CMD>lua require('telescope.builtin').lsp_definitions()<CR>",
                            map_opt)
                        buf_map(bufnr, "n", "<Leader>lh", "<CMD>lua vim.lsp.buf.hover()<CR>", map_opt)
                        buf_map(bufnr, "n", "<Leader>ln", "<CMD>lua vim.lsp.buf.rename()<CR>", map_opt)
                        buf_map(bufnr, "n", "<Leader>la", "<CMD>lua vim.lsp.buf.code_action()<CR>", map_opt)

                    end,
                    capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol
                                                                                   .make_client_capabilities())
                }

                server:setup(opts)
            end)
        end
    }

    use {
        "hrsh7th/nvim-cmp",
        requires = {"hrsh7th/cmp-nvim-lsp", "hrsh7th/cmp-buffer", "hrsh7th/cmp-path", "hrsh7th/cmp-cmdline",
                    "hrsh7th/cmp-vsnip", "hrsh7th/vim-vsnip"},
        config = function()
            local cmp = require "cmp"

            cmp.setup {
                mapping = {
                    ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), {"i", "c"}),

                    ["<CR>"] = cmp.mapping.confirm({
                        select = true
                    }),

                    ["<Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_next_item()
                        elseif vim.fn["vsnip#available"](1) == 1 then
                            feedkey("<Plug>(vsnip-expand-or-jump)", "")
                        elseif has_words_before() then
                            cmp.complete()
                        else
                            fallback()
                        end
                    end, {"i", "s"})
                },

                sources = {{
                    name = "nvim_lsp"
                }, {
                    name = "luasnip"
                }, {
                    name = "buffer"
                }, {
                    name = "path"
                }}
            }
        end
    }

end

return Module
