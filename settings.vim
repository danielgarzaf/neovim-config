set path+=**
" set wildmode=longest,list,full
set wildmenu

" Ignore files
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=**/coverage/*
set wildignore+=**/node_modules/*
set wildignore+=**/android/*
set wildignore+=**/ios/*
set wildignore+=**/.git/*

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
set nowritebackup
set undodir=~/.config/nvim/plugged/undodir
set undofile
set incsearch
set scrolloff=8
set showmode
set completeopt=menuone,noinsert,noselect
set colorcolumn=80
set signcolumn=number
set cmdheight=2
set updatetime=50
set shortmess+=c
set termguicolors
set noshowmode

<<<<<<< HEAD:settings.vim
set inccommand=split

augroup my_group
    au!
    au BufWritePost $MYVIMRC source %
    au FileType c,cpp setlocal shiftwidth=2 tabstop=2 softtabstop=2
augroup END

=======
au BufWritePost $MYVIMRC source %
au FileType c,cpp setlocal shiftwidth=2 tabstop=2 softtabstop=2
>>>>>>> 35c901c... more windows specific configurations:general/settings.vim
