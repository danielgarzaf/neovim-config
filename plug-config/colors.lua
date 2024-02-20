require'tokyonight'.setup({
    transparent = true,
    comments = { italic = false },
    keywords = { italic = false },
})
vim.g.tokyonight_dark_float = false
vim.cmd[[colorscheme tokyonight-night]]
