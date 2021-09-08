syntax enable
set exrc
set guicursor=a:blinkon100
set relativenumber
set nohlsearch
set hidden
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nu
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.config/nvim/plugged/undodir
set undofile
set incsearch
set scrolloff=8
set showmode
set completeopt=menuone,noinsert,noselect
set colorcolumn=80
set signcolumn=yes
set cmdheight=2
set updatetime=50
set shortmess+=c
set termguicolors
set statusline+=\ %F

au! BufWritePost $MYVIMRC source %
