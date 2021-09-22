call plug#begin('~/.local/share/nvim/site/autoload')

" LSP Plugs
Plug 'neovim/nvim-lspconfig'
" Plug 'hrsh7th/nvim-compe'
" Plug 'hrsh7th/vim-vsnip'

" Telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'

" Treesitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'

Plug 'jiangmiao/auto-pairs'
Plug 'gruvbox-community/gruvbox'

" Coc
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Fuzzy finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install()  } }
Plug 'junegunn/fzf.vim'

" Snippets
Plug 'honza/vim-snippets'
Plug 'rafamadriz/friendly-snippets'

Plug 'tpope/vim-fugitive'

" Plug 'mxw/vim-jsx'
" Plug 'chemzqm/vim-jsx-improve'
" Plug 'maxmellon/vim-jsx-pretty'
Plug 'chemzqm/vim-jsx-improve'

Plug 'vim-airline/vim-airline'

call plug#end()
