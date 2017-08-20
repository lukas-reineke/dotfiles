"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Inster Mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Complete
function! Smart_Complete()
    let line = getline('.')
    let substr = strpart(line, -1, col('.')+1)
    let substr = matchstr(substr, "[^ \t]*$")
    let has_slash = match(substr, '\/') != -1
    if (has_slash)
        return "\<C-X>\<C-F>"
    elseif (&omnifunc ==# '')
        return "\<ESC>a\<C-X>\<C-P>"
    else
        return "\<C-X>\<C-O>"
    endif
endfunction

inoremap <C-N> <C-R>=Smart_Complete()<CR>
inoremap <C-P> <C-N>
inoremap <C-B> <ESC>a

