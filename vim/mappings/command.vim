"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Command Mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" `<Tab>`/`<S-Tab>` to move between matches without leaving incremental search.
set wcm=<C-Z>
cnoremap <expr> <Tab> getcmdtype() == '/' \|\| getcmdtype() == '?' ? '<CR>/<C-r>/' : '<C-z>'
cnoremap <expr> <S-Tab> getcmdtype() == '/' \|\| getcmdtype() == '?' ? '<CR>?<C-r>/' : '<S-Tab>'

cnoremap <silent> <C-f> <C-c>:call ctrlp#init(ctrlp#commandline#id())<CR>

