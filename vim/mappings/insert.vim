"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Complete {{{

imap <C-X><C-F> <ESC>:cd %:p:h<CR>a<plug>(fzf-complete-file)
inoremap <C-B> <C-E>
inoremap <C-L> <C-X><C-L>
inoremap <C-E> <ESC>BDi<><ESC>hpyypa/<ESC>O
inoremap <C-O> <C-X><C-N>

inoremap <expr> <C-X><C-L> fzf#vim#complete(fzf#wrap({
\   'prefix': '^.*$',
\   'source': 'rg -n ^ --color always',
\   'options': '--ansi --delimiter : --nth 3..',
\   'reducer': { lines -> join(split(lines[0], ':\zs')[2:], '') }
\}))

inoremap <C-F>
    \ <C-O>:let b:oldpwd = getcwd() <bar>
    \ lcd %:p:h<cr><C-X><C-F>
imap <expr> <C-G> pumvisible()
    \ ? len(v:completed_item) ? '<C-Y><C-F>' : '<C-N><C-Y><C-F>'
    \ : '<C-G>'

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

