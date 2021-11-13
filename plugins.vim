call plug#begin('~/.local/share/nvim/site/autoload')
" Telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', {'do': 'make'}

" Treesitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'

" Autopairs
Plug 'jiangmiao/auto-pairs'

" Cock haha
Plug 'neoclide/coc.nvim', {'branch': 'release'}


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

" Gruvbox baybee
Plug 'morhetz/gruvbox'

" PlatformIO
Plug 'coddingtonbear/neomake-platformio'

<<<<<<< HEAD:plugins.vim
Plug 'danielgarzaf/autocomment.nvim'
=======
Plug 'MaskRay/ccls'

Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
>>>>>>> 35c901c... more windows specific configurations:vim-plug/plugins.vim

call plug#end()
