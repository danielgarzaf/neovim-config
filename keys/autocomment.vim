let s:cmt_chars = {
            \ "python" : "#",
            \ "vim" : "\"",
            \ "c" : "//",
            \ "cpp" : "//",
            \ "java" : "//",
            \ "lua" : "--",
            \ "sh" : "#"
            \ }


function! IsCommented(line) abort
    return split(a:line)[0] == get(s:cmt_chars, &filetype)
endfunction


function! IsBlankLine(line) abort
    return len(split(a:line)) == 0
endfunction


function! Comment() abort
    let comment = get(s:cmt_chars, &filetype)
    execute "normal! ^i".comment." \<Esc>"
endfunction


function! Uncomment() abort
    let comment = get(s:cmt_chars, &filetype)
    let del_amt = repeat("x", len(comment)+1)
    execute "normal! ^".del_amt
endfunction


function! GetUncommentedLineNumbers(lines, offset) abort 
    let comment = get(s:cmt_chars, &filetype)
    let list = []

    let idx = 0
    while idx < len(a:lines)
        let line = a:lines[idx]
        if !IsBlankLine(line) && !IsCommented(line)  
            call add(list, idx + a:offset)
        endif
        let idx += 1
    endwhile

    return list
endfunction


function! VAutoComment(start, end) abort
    let lines = getline(a:start, a:end)
    let comment = get(s:cmt_chars, &filetype)


    " Get in position to start comment/uncomment process
    execute "normal! ".a:start."G"

    let uncommented_line_nums = GetUncommentedLineNumbers(lines, a:start)

    " If all the lines are uncommented, comment them
    if len(uncommented_line_nums) == len(lines)
        for line in lines
            call Comment()
            execute "normal! j"
        endfor
    " If there are any lines uncommented in the range, comment them out
    elseif len(uncommented_line_nums) > 0
        for line_num in uncommented_line_nums
            execute "normal! ".line_num."G^i".comment." \<Esc>"
        endfor
    else
        for line in lines
            call Uncomment()
            execute "normal! j"
        endfor
    endif
endfunction


function! s:n_auto_comment() abort
    let comment = get(s:cmt_chars, &filetype)
    let line = getline('.')

    if IsBlankLine(line) 
        return ""
    endif

    if IsCommented(line)
        let del_amt = repeat("x", len(comment)+1)
        let move_left_amt = repeat("h", len(comment)+1)
        return "mz^".del_amt."`z".move_left_amt
    endif

    let move_right_amt = repeat("l", len(comment)+1)
    return "mz^i".comment." \<Esc>`z".move_right_amt
endfunction


nnoremap <silent><expr><leader>/ <SID>n_auto_comment() 
vnoremap <leader>/ :<BS><BS><BS><BS><BS>call VAutoComment(line("'<"), line("'>"))<CR>gv
