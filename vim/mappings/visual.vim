"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Visual Mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Move selected lines up and down
vnoremap <DOWN> :m '>+1<CR>gv=gv
vnoremap <UP> :m '<-2<CR>gv=gv
" Indent selected lines
vnoremap <LEFT> <gv
vnoremap <RIGHT> >gv

" expand region
vnoremap v <Plug>(expand_region_expand)
vnoremap <C-v> <Plug>(expand_region_shrink)

xnoremap Q :'<,'>:normal @q<CR>

vnoremap H ^
vnoremap L $
vnoremap K 5k
vnoremap J 5j

