local function setup_colorscheme()
    require('tokyonight').setup({
        transparent = true,
        styles = {
            comments = { italic = false },
            keywords = { italic = false },
            floats = "transparent",
            sidebars = "transparent",
        },
    })

    vim.lsp.handlers["textDocument/hover"] =
    vim.lsp.with(
        vim.lsp.handlers.hover,
        {
            border = "single"
        }
    )

    vim.lsp.handlers["textDocument/signatureHelp"] =
    vim.lsp.with(
        vim.lsp.handlers.signature_help,
        {
            border = "single"
        }
    )

    vim.diagnostic.config {
        float = { border = "rounded" },
    }

    vim.cmd.colorscheme "tokyonight-night"
    vim.cmd([[hi Normal ctermbg=none guibg=none]])
    vim.g.tokyonight_night_float = false
end

return {
    {
        'folke/tokyonight.nvim',
        config = setup_colorscheme
    },
}
