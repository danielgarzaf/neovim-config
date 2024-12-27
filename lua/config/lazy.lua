-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "http://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({"git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath})
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out, "WarningMsg"},
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
-- Put the cloned lazy repo into the runtimepath
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Setup lazy.nvim
require("lazy").setup({
    spec = {
        -- Telescope
        { "nvim-lua/popup.nvim" },
        { "nvim-lua/plenary.nvim" },
        { "nvim-telescope/telescope.nvim",
            dependencies = {
                 "nvim-telescope/telescope-fzf-native.nvim",
                 build = "make",
             }
         },

        -- LSP
        { "neovim/nvim-lspconfig" },

        -- Autocompletion
        { "neovim/nvim-lspconfig" },
        { 'hrsh7th/cmp-nvim-lsp' },
        { 'hrsh7th/cmp-buffer' },
        { 'hrsh7th/cmp-path' },
        { 'hrsh7th/nvim-cmp' },
        { 'L3MON4D3/LuaSnip' },
        { 'saadparwaiz1/cmp_luasnip' },

        -- Treesitter
        { 'nvim-treesitter/nvim-treesitter' },
        { 'nvim-treesitter/playground' },

        -- Snippets
        { 'honza/vim-snippets' },
        { 'rafamadriz/friendly-snippets' },

        -- Fugitive
        { 'tpope/vim-fugitive' },

        -- Web-dev essentials
        { 'chemzqm/vim-jsx-improve' },
        { 'kyazdani42/nvim-web-devicons' },

        -- Status line
        { 'hoob3rt/lualine.nvim' },

        -- Color scheme
        { 'folke/tokyonight.nvim' },

        -- PlatformIO
        { 'coddingtonbear/neomake-platformio' },
        { 'danielgarzaf/autocomment.nvim' },
        { 'tpope/vim-classpath' },
        { 'psf/black' },

        -- Rust
        { "rust-lang/rust.vim" }
    },

    -- Configure any other settings here. See the documentation for more details.
    -- colorscheme that will be used when installing plugins.
    install = { colorscheme = {"habamax"} },
    -- automatically check for plugin updates
    checker  = { enabled = true }
})
