"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Global {{{

inoremap <C-X><C-F> <C-O>:cd %:p:h<CR><C-X><C-F>

inoremap <buffer><silent> ) <C-R>=AutoPairsInsert(')')<CR>
inoremap <silent><expr> ( complete_parameter#pre_complete("()")

" }}}
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Smart Complete {{{

function! Smart_Complete()
    let line = getline('.')
    let substr = strpart(line, -1, col('.')+1)
    let substr = matchstr(substr, "[^ \t]*$")
    let has_slash = match(substr, '\/') != -1
    if (has_slash)
        " return "\<C-X>\<C-F>"
        return "\<ESC>:cd %:p:h\<CR>a\<C-X>\<C-F>"
    elseif (&omnifunc ==# '')
        return "\<C-N>"
    else
        return "\<C-X>\<C-O>"
    endif
endfunction

inoremap <C-N> <C-R>=Smart_Complete()<CR>
inoremap <C-X><C-F> <ESC>:cd %:p:h<CR>a<C-X><C-F>
inoremap <C-B> <ESC>a

" }}}
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Smart Backspace {{{

inoremap <silent><expr><S-BS>
            \ (&indentexpr isnot '' ? &indentkeys : &cinkeys) =~? '!\^F' &&
            \ &backspace =~? '.*eol\&.*start\&.*indent\&' &&
            \ !search('\S','nbW',line('.')) ? "\<C-U>\<bs>" .
            \ (getline(line('.')-1) =~ '\S' ? "" : "\<C-F>") : "\<C-R>=AutoPairsDelete()\<CR>"

" }}}
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" vim:foldmethod=marker:foldlevel=0

