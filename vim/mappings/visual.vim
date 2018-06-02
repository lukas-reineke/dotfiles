"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Global {{{
vnoremap <DOWN> :m '>+1<CR>gv=gv
vnoremap <UP> :m '<-2<CR>gv=gv
vnoremap < <gv
vnoremap > >gv

" }}}
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Global {{{

vmap I <Plug>(niceblock-I)
vmap gI <Plug>(niceblock-gI)
vmap A <Plug>(niceblock-A)

xnoremap Q :normal @q<CR>

vnoremap H ^
vnoremap L $
vnoremap K 5k
vnoremap J 5j

" }}}
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" vim:foldmethod=marker:foldlevel=0

