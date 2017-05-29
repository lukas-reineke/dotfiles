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
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

