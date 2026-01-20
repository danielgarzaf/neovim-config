local function setup_all_lsps()
    -- Setup lspconfig.
    local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

    local function on_attach()
        vim.keymap.set("n", "K", function() vim.lsp.buf.hover({ border = "single" }) end, { buffer = 0 })
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = 0 })
        vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, { buffer = 0 })
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { buffer = 0 })
        vim.keymap.set("n", "]g", function() vim.diagnostic.jump({ count = 1, float = true }) end, { buffer = 0 })
        vim.keymap.set("n", "[g", function() vim.diagnostic.jump({ count = -1, float = true }) end, { buffer = 0 })
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { buffer = 0 })
        vim.keymap.set("n", "<leader>ac", vim.lsp.buf.code_action, { buffer = 0 })
        vim.keymap.set("n", "gl", "<cmd>Telescope diagnostics<cr>", { buffer = 0 })
        vim.keymap.set("n", "gr", "<cmd>Telescope lsp_references<cr>", { buffer = 0 })
        vim.keymap.set("i", "<C-Space>", vim.lsp.completion.get, { buffer = 0 })
        vim.keymap.set("i", "<C-Space>", vim.lsp.buf.completion, { buffer = 0 })
    end

    -- C / C++
    require("lspconfig").clangd.setup {
        cmd = { "clangd.exe" },
        capabilities = capabilities,
        on_attach = on_attach,
        filetypes = { "c", "cpp", "h", "hpp" },
    }

    require('lspconfig').tinymist.setup {
        cmd = { vim.fn.expand('$HOME/.local/share/nvim/typst-preview/tinymist-darwin-arm64') },
        capabilities = capabilities,
        on_attach = on_attach,
        -- filetypes = { "typst" },
        settings = {
            formatterMode = "typstyle",
            exportPdf = "onType",
            semanticTokens = "disable"
        }

    }

    -- Vimscript
    require("lspconfig").vimls.setup {
        capabilities = capabilities,
        on_attach = on_attach,
    }

    -- Java
    require("lspconfig").java_language_server.setup {
        cmd = { vim.fn.expand("$HOME/repos/java-language-server/dist/lang_server_linux.sh") },
        capabilities = capabilities,
        on_attach = on_attach,
        filetypes = {
            "java",
        },
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
            "tsx",
            "jsx",
            "typescriptreact",
            "javascriptreact",
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
    -- default_capabilities
    require("lspconfig.ui.windows").default_options.border = "single"

    vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
            local filename = args.match
            local filetype, _ = vim.filetype.match({ filename = filename })
            -- if filetype == "java" then return end -- java-language-server autoformatting is weird
            local client = vim.lsp.get_client_by_id(args.data.client_id)
            if not client then return end
            if client.supports_method("textDocument/formatting") then
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
                        -- Load luvit types when the 'vim.uv' word if found
                        { path = "${3rd}/luv/library",     words = { "vim%.uv" } },
                        { path = "${3rd}/busted/library" },
                        { path = "${3rd}/luassert/library" },
                        { path = "${3rd}/plenary/library" },
                        "nvim-cmp/lua/cmp/types",
                    }
                }
            }
        },
        config = setup_all_lsps
    },
}
