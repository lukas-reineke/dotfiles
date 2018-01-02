"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Complete {{{

inoremap <C-O> <C-X><C-O>
inoremap <C-F> <ESC>:cd %:p:h<CR>a<C-X><C-F>
inoremap <C-B> <ESC>a
inoremap <silent><expr> ( complete_parameter#pre_complete("()")

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

