call plug#begin('~/.local/share/nvim/site/autoload')

" LSP Plugs
" Plug 'neovim/nvim-lspconfig'
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

" Autopairs
Plug 'jiangmiao/auto-pairs'

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
" Plug 'maxmellon/vim-jsx-pretty'
Plug 'chemzqm/vim-jsx-improve'

" Plug 'vim-airline/vim-airline'
" Plug 'glepnir/galaxyline.nvim' , {'branch': 'main'}
Plug 'hoob3rt/lualine.nvim'

Plug 'kyazdani42/nvim-web-devicons'

" Gruvbox baybeee
Plug 'morhetz/gruvbox'
" Plug 'gruvbox-community/gruvbox'

" PlatformIO
Plug 'coddingtonbear/neomake-platformio'

call plug#end()
