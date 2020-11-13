"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Command Mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" `<Tab>`/`<S-Tab>` to move between matches without leaving incremental search.
set wildcharm=<C-Z>
cnoremap <expr> <Tab> getcmdtype() == '/' \|\| getcmdtype() == '?' ? '<CR>/<C-r>/' : '<C-z>'
cnoremap <expr> <S-Tab> getcmdtype() == '/' \|\| getcmdtype() == '?' ? '<CR>?<C-r>/' : '<S-Tab>'

cnoremap <C-E> e %:h/

cnoremap <C-J> <DOWN>
cnoremap <C-K> <UP>

cabbrev nw noautocmd write
