local function setup_all_lsps()
    -- Setup lspconfig.
    local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

    local function on_attach()
        vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = 0 })
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = 0 })
        vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, { buffer = 0 })
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { buffer = 0 })
        vim.keymap.set("n", "]g", vim.diagnostic.goto_next, { buffer = 0 })
        vim.keymap.set("n", "[g", vim.diagnostic.goto_prev, { buffer = 0 })
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { buffer = 0 })
        vim.keymap.set("n", "<leader>ac", vim.lsp.buf.code_action, { buffer = 0 })
        vim.keymap.set("n", "gl", "<cmd>Telescope diagnostics<cr>", { buffer = 0 })
        vim.keymap.set("n", "gr", "<cmd>Telescope lsp_references<cr>", { buffer = 0 })
        vim.keymap.set("i", "<C-Space>", vim.lsp.buf.completion, { buffer = 0 })

    end

    -- C / C++
    require("lspconfig").clangd.setup {
        cmd = { "C:\\Program Files\\LLVM-18.1.8\\bin\\clangd.exe" },
        capabilities = capabilities,
        on_attach = on_attach,
        filetypes = { "c", "cpp", "h", "hpp" },
    }

    -- Vimscript
    require("lspconfig").vimls.setup {
        capabilities = capabilities,
        on_attach = on_attach,
    }

    -- Java
    require("lspconfig").java_language_server.setup {
        capabilities = capabilities,
        on_attach = on_attach,
    }

    -- Go
    require("lspconfig").gopls.setup {
        capabilities = capabilities,
        on_attach = on_attach,
    }

    -- Rust
    require("lspconfig").rust_analyzer.setup {
        capabilities = capabilities,
        on_attach = on_attach,
    }

    -- Lua
    require("lspconfig").lua_ls.setup {
        capabilities = capabilities,
        on_attach = on_attach,
        settings = {
            Lua = {
                diagnostics = {
                    globals = { "require", "os", "io" }
                }
            }
        }
    }

    -- Python
    require("lspconfig").pyright.setup {
        capabilities = capabilities,
        on_attach = on_attach,
    }

    -- Typescript/Javascript
    require("lspconfig").ts_ls.setup {
        capabilities = capabilities,
        on_attach = on_attach,
        filetypes = {
            "javascript",
            "typescript",
            "vue",
        },
    }

    -- Django
    require("lspconfig").djlsp.setup {
        cmd = { "django-template-lsp.exe" },
        capabilities = capabilities,
        on_attach = on_attach,
        filetypes = {
            "html",
            "htmldjango",
        },
    }

    -- Visual configurations
    require("lspconfig.ui.windows").default_options.border = "single"

    vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
            local client = vim.lsp.get_client_by_id(args.data.client_id)
            if not client then return end
            if client.supports_method("textDocument/formatting", 0) then
                vim.api.nvim_create_autocmd("BufWritePre", {
                    buffer = args.buf,
                    callback = function()
                        vim.lsp.buf.format({ bufnr = args.buf, id = client.id })
                    end
                })
            end
        end
    })
end

return {
    -- LSP
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            {
                "folke/lazydev.nvim",
                ft = "lua", -- only load on lua files
                opts = {
                    library = {
                        -- See the configuration section for more details.
                        -- Load luvit types when the 'vim.uv' word if found
                        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
                    }
                }
            }
        },
        config = setup_all_lsps
    },
}
