"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Inster Mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Paste
inoremap <C-P> <C-O>p

inoremap ö []<ESC>i
inoremap ä ]

inoremap Ö {}<ESC>i
inoremap Ä }


function! Smart_TabComplete()
    let line = getline('.')                         " current line

    let substr = strpart(line, -1, col('.')+1)      " from the start of the current
    " line to one character right
    " of the cursor
    let substr = matchstr(substr, "[^ \t]*$")       " word till cursor
    let has_period = match(substr, '\.') != -1      " position of period, if any
    let has_slash = match(substr, '\/') != -1       " position of slash, if any
    if (!has_period && !has_slash)
        return "\<C-X>\<C-P>"                         " existing text matching
    elseif ( has_slash )
        return "\<C-X>\<C-F>"                         " file matching
    else
        return "\<C-X>\<C-O>"                         " plugin matching
    endif
endfunction

inoremap <C-n> <c-r>=Smart_TabComplete()<CR>

