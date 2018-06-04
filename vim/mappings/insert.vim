"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Complete {{{

inoremap <C-O> <C-X><C-O>
inoremap <C-F> <ESC>:cd %:p:h<CR>a<C-X><C-F>
imap <C-X><C-F> <ESC>:cd %:p:h<CR>a<plug>(fzf-complete-file)
inoremap <C-B> <C-E>
inoremap <silent><expr> ( complete_parameter#pre_complete("()")
inoremap <C-L> <C-X><C-L>
imap <C-X><C-L> <plug>(fzf-complete-line)
inoremap <C-G> <C-Y>

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

