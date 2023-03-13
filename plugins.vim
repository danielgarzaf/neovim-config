call plug#begin('~/.local/share/nvim/site/autoload')
" Telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', {'do': 'make'}

" LSP
Plug 'neovim/nvim-lspconfig'

" Autocompletion
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/nvim-cmp'
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'

" Treesitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'

" Autopairs
Plug 'jiangmiao/auto-pairs'

" Snippets
Plug 'honza/vim-snippets'
Plug 'rafamadriz/friendly-snippets'

" Fugitive
Plug 'tpope/vim-fugitive'

" Soydev essentials
Plug 'chemzqm/vim-jsx-improve'
Plug 'kyazdani42/nvim-web-devicons'

" Status line
Plug 'hoob3rt/lualine.nvim'

" Color scheme
Plug 'folke/tokyonight.nvim'

" PlatformIO
Plug 'coddingtonbear/neomake-platformio'

Plug 'danielgarzaf/autocomment.nvim'

Plug 'tpope/vim-classpath'

call plug#end()
