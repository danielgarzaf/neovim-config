-- Setup lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

local function on_attach()
    vim.keymap.set("n", "K", vim.lsp.buf.hover, {buffer = 0})
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, {buffer = 0})
    vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, {buffer = 0})
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {buffer = 0})
    vim.keymap.set("n", "]g", vim.diagnostic.goto_next, {buffer = 0})
    vim.keymap.set("n", "[g", vim.diagnostic.goto_prev, {buffer = 0})
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {buffer = 0})
    vim.keymap.set("n", "<leader>ac", vim.lsp.buf.code_action, {buffer = 0})
    vim.keymap.set("n", "gl", "<cmd>Telescope diagnostics<cr>", {buffer = 0})
    vim.keymap.set("n", "gr", "<cmd>Telescope lsp_references<cr>", {buffer = 0})
    vim.keymap.set("i", "<C-Space>", vim.lsp.buf.completion, {buffer = 0})

end

-- C / C++
require'lspconfig'.clangd.setup{
    capabilities = capabilities,
    on_attach = on_attach,
    filetypes = {'c', 'cpp', 'h', 'hpp'},
}

-- Vimscript
require'lspconfig'.vimls.setup{
    capabilities = capabilities,
    on_attach = on_attach,
}

-- Java
require'lspconfig'.java_language_server.setup{
    capabilities = capabilities,
    on_attach = on_attach,
}

-- Go
require'lspconfig'.gopls.setup{
    capabilities = capabilities,
    on_attach = on_attach,
}

-- Rust
require'lspconfig'.rust_analyzer.setup{
    capabilities = capabilities,
    on_attach = on_attach,
}

-- Lua
require'lspconfig'.lua_ls.setup {
    capabilities = capabilities,
    on_attach = on_attach,
}

-- Python
require'lspconfig'.pyright.setup {
    capabilities = capabilities,
    on_attach = on_attach,
}

-- Visual configurations
require('lspconfig.ui.windows').default_options.border = 'single'
