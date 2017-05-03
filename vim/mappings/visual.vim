"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Visual Mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Move selected lines up and down
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Indent selected lines
vnoremap < <gv
vnoremap > >gv

" expand region
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

