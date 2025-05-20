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
    else
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
            echo "Going back to buffer n. '"..luaeval("vim.g.prev_winnr").."'"
            lua vim.api.nvim_set_current_win(vim.g.prev_winnr)
            execute "'z"
        else
            mark z
            let g:prev_winnr = luaeval("vim.api.nvim_get_current_win()")
            call TermFocus()
        endif
        return
    endif

    mark z
    let g:prev_winnr = luaeval("vim.api.nvim_get_current_win()")

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
nnoremap <silent> <leader>; :TermToggle<CR>
nnoremap <silent> <A-2> :TermToggle<CR>

inoremap <silent> <C-n> <esc>:TermToggle<CR>
tnoremap <silent> <C-n> <C-\><C-N>:TermToggle<CR>
inoremap <silent> <A-2> <esc>:TermToggle<CR>
tnoremap <silent> <A-2> <C-\><C-N>:TermToggle<CR>

tnoremap <silent> <C-[> <C-\><C-N>
