let s:chars = {
            \ "python" : "#",
            \ "vim" : "\"",
            \ "c" : "//",
            \ "cpp" : "//",
            \ "java" : "//"
            \ }


function! IsComment(line, comment)
    return split(a:line)[0] == a:comment
endfunction


function! IsBlankLine(line)
    return len(split(a:line)) == 0
endfunction


function! Comment(comment)
    let l:move_right_amt = repeat("l", len(a:comment)+1)
    execute "normal! 0i".a:comment." \<Esc>"
endfunction


function! Uncomment(comment)
    let l:del_amt = repeat("x", len(a:comment)+1)
    execute "normal! ^".l:del_amt
endfunction


function! GetUncommentedLineNumbers(lines, start, comment) 
    let l:idx = 0
    let l:list = []
    while l:idx < len(a:lines)
        let l:line = a:lines[l:idx]
        if !IsBlankLine(l:line) && !IsComment(l:line, a:comment)  
            call add(l:list, l:idx + a:start)
        endif
        let l:idx += 1
    endwhile
    return l:list
endfunction


function! VAutoComment(start, end)
    let l:comment = get(s:chars, &filetype)
    let g:lines = getline(a:start, a:end)

    let g:uncommented_idxs = GetUncommentedLineNumbers(g:lines, a:start, l:comment)

    execute "normal! ".a:start."G"
    " If there are any lines uncommented in the range, comment them out
    if len(g:uncommented_idxs) > 0
        for l:idx in g:uncommented_idxs
            execute "normal! ".l:idx."G0i".l:comment." \<Esc>"
        endfor
    " If all the lines are uncommented, comment them
    elseif len(g:uncommented_idxs) == len(g:lines)
        for l:line in g:lines
            call Comment(l:comment)
            execute "normal! j"
        endfor
    else
        for l:line in g:lines
            call Uncomment(l:comment)
            execute "normal! j"
        endfor
    endif
endfunction


function! s:n_auto_comment() abort
    let l:comment = get(s:chars, &filetype)

    let l:line = getline('.')
    if IsBlankLine(l:line) 
        return ""
    endif

    " Checks if current line is a comment
    if IsComment(l:line, l:comment)
        let l:del_amt = repeat("x", len(l:comment)+1)
        let l:move_left_amt = repeat("h", len(l:comment)+1)
        return "mz^".l:del_amt."`z".l:move_left_amt
    endif

    let l:move_right_amt = repeat("l", len(l:comment)+1)
    return "mz^i".l:comment." \<Esc>`z".l:move_right_amt
endfunction


function! s:v_auto_comment() abort
    let l:comment = get(s:chars, &filetype)
    if IsComment(getline('.'), l:comment)
        let l:del_amt = repeat("x", len(l:comment)+1)
        let l:move_left_amt = repeat("h", len(l:comment)+1)
        return ":norm! ^".l:del_amt."\<CR>gv=gv" 
    endif

    return ":s!^!".l:comment." !\<CR>gv=gv"
endfunction


nnoremap <silent><expr><leader>/ <SID>n_auto_comment() 
vnoremap <leader>/ :<BS><BS><BS><BS><BS>let g:start=line("'<")<CR>:let g:end=line("'>")<CR>:call VAutoComment(g:start, g:end)<CR>gv

