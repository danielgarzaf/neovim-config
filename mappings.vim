let g:mapleader = " "

" Jump between windows
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>

" Quick vsplit/split
nnoremap <leader>vs :vsplit <CR> 
nnoremap <leader>s :split<CR>

" Resizing windows
nnoremap <leader>+ :vertical resize +5<CR>
nnoremap <leader>- :vertical resize -5<CR>

" Better indentation
vnoremap < <gv
vnoremap > >gv
vnoremap <C-c> "*y

" Yank rest of line
nnoremap Y y$

" Center line when doing "/" search
nnoremap n nzzzv
nnoremap N Nzzzv

" Join next line into current line
nnoremap J mzJ`z

" Scroll up/down with 5 lines of space
nnoremap <expr> k (v:count > 5 ? "m'" . v:count : "") . 'k'
nnoremap <expr> j (v:count > 5 ? "m'" . v:count : "") . 'j'

" Move current selection of VISUAL mode (line or regular mode) up/down
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Insert space down from current line without going into insert mode
nnoremap <leader><CR> mzo<Esc>`z

" Built in file browser
nnoremap <leader>pv :Ex<CR>

function! SwitchSlash(start, end, range) abort
    let lines = getline(a:start, a:end)
    for i in range(len(lines))
        if stridx(lines[i], "\\") >= 0
            call setline(a:start + i, substitute(lines[i], "\\\\", "/", "g"))
        else
            call setline(a:start + i, substitute(lines[i], "/", "\\\\", "g"))
        endif
    endfor
endfunction
command! -range SwitchSlash call SwitchSlash(<line1>, <line2>, <range>)
vnoremap <silent><leader>z :SwitchSlash<CR>gv


" Terminal

function! TermOpened() abort
    if exists('s:currterm')
        return bufwinnr(s:currterm) != -1
    endif
    return 0
endfunction

function! TermFocused() abort
    if exists('g:termwinnr')
        let currwin = luaeval("vim.api.nvim_get_current_win()")
        return g:termwinnr == currwin
    endif
    return 0
endfunction


function! TermFocus() abort
    if TermOpened()
        lua vim.api.nvim_set_current_win(vim.g.termwinnr)
    endif
endfunction

function! TermToggle() abort
    let s:term = "zsh"
    if has('win32')
        let s:term = "powershell"
    endif

    if TermOpened()
        if TermFocused()
            execute "quit"
        else
            call TermFocus()
        endif
        return
    endif

    execute "botright split"
    execute "wincmd j"
    execute "resize -8"
    if exists('s:currterm')
        echo "Opening buffer: ". s:currterm
        if bufexists(s:currterm)
            execute "edit " . s:currterm
            let g:termwinnr = luaeval("vim.api.nvim_get_current_win()")
        else
            unlet s:currterm
            call TermToggle()
        endif
    else
        execute "term ".s:term
        let s:currterm = bufname()
        let g:termwinnr = luaeval("vim.api.nvim_get_current_win()")
    endif
endfunction

command! TermToggle call TermToggle()
nnoremap <silent> <leader>' :TermToggle<CR>
tnoremap <silent> <C-[> <C-\><C-N>
