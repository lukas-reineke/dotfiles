"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Complete {{{

" inoremap <C-O> <C-X><C-O>
imap <C-X><C-F> <ESC>:cd %:p:h<CR>a<plug>(fzf-complete-file)
inoremap <C-B> <C-E>
inoremap <silent><expr> ( complete_parameter#pre_complete("()")
inoremap <C-L> <C-X><C-L>
imap <C-X><C-L> <plug>(fzf-complete-line)
inoremap <C-E> <ESC>BDi<><ESC>hpyypa/<ESC>O
inoremap <silent><expr> <C-o> coc#refresh()

inoremap <C-F>
    \ <C-O>:let b:oldpwd = getcwd() <bar>
    \ lcd %:p:h<cr><C-X><C-F>
imap <expr> <C-G> pumvisible()
    \ ? len(v:completed_item) ? '<C-Y><C-F>' : '<C-N><C-Y><C-F>'
    \ : '<C-G>'

augroup pathRestore
    autocmd!
    autocmd CompleteDone *
        \ if exists('b:oldpwd') |
        \     cd `=b:oldpwd` |
        \     unlet b:oldpwd |
        \ endif
augroup END

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

