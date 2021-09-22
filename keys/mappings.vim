let mapleader = " "

" Jump between windows
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>l :wincmd l<CR>

" Quick vsplit/split
nnoremap <leader>vs :vsplit <CR> 
nnoremap <leader>s :split<CR>

" Resizing windows
nnoremap <leader>+ :vertical resize +5<CR>
nnoremap <leader>- :vertical resize -5<CR>
nnoremap <leader>rp :resize 100<CR>

" Better tabbing
vnoremap < <gv
vnoremap > >gv

nmap <leader>gd <Plug>(coc-definition)
nmap <leader>gr Plug>(coc-references)
nnoremap <C-p> :Telescope git_files<CR>
nnoremap <leader>t :Telescope find_files<CR>

" Legendary remaps
nnoremap Y y$
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z

nnoremap <expr> k (v:count > 5 ? "m'" . v:count : "") . 'k'
nnoremap <expr> j (v:count > 5 ? "m'" . v:count : "") . 'j'

vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

nnoremap <leader><CR> mzo<Esc>`z

nnoremap <leader>gs :Git status<CR>
nnoremap <leader>ga :Git add 
nnoremap <leader>gaa :Git add .<CR>
