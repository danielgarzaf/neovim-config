set path+=**
set rtp+=~/.fzf

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
set wildignore+=**.exe
set wildignore+=**.hex
set wildignore+=**.cfg
set wildignore+=**.elf

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

set inccommand=split

let $LANG = 'en'

augroup filetypedetect
    au! BufRead,BufNewFile *.h,*.he,*.ce,*.c setfiletype c
    au! BufRead,BufNewFile Jenkinsfile setfiletype groovy
    au! FileType c setlocal shiftwidth=3 tabstop=3
augroup END

augroup format_on_save
     au! BufWrite *.py :Black
     au! BufWrite *.rs :RustFmt
augroup END
