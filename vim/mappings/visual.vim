"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Visual Mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Move selected lines up and down
vnoremap <DOWN> :m '>+1<CR>gv=gv
vnoremap <UP> :m '<-2<CR>gv=gv
" Indent selected lines
vnoremap < <gv
vnoremap > >gv

" expand region
" vnoremap v <Plug>(expand_region_expand)
" vnoremap <C-v> <Plug>(expand_region_shrink)
" v	I		|<Plug>(niceblock-I)|
" v	gI		|<Plug>(niceblock-gI)|
" v	A		|<Plug>(niceblock-A)|

vmap I <Plug>(niceblock-I)
vmap gI <Plug>(niceblock-gI)
vmap A <Plug>(niceblock-A)

xnoremap Q :'<,'>:normal @q<CR>

vnoremap H ^
vnoremap L $
vnoremap K 5k
vnoremap J 5j

