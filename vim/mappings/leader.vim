"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Leader Mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let mapleader = "\<Space>"


" switch to last buffer
nnoremap <Leader><Leader> <C-^>

" save/close
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :call CloseOnLast()<CR>
nnoremap <Leader>x :x<CR>

" open from dir
nnoremap <Leader>n :edit <C-R>=expand('%:p:h') . '/'<CR>

