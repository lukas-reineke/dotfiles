"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Leader Mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let mapleader = "\<Space>"


" switch to last buffer
nnoremap <Leader><Leader> <C-^>
" open CtrlPBuffer
nnoremap <Leader><C-P> :CtrlPBuffer<CR>
nnoremap <Leader><C-H> :hide<CR>
nnoremap <Leader><C-K> :sv#<CR>
nnoremap <Leader><C-L> :vs#<CR>

" save/close
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :call CloseOnLast()<CR>
nnoremap <Leader>x :x<CR>

" open from dir
nnoremap <Leader>n :edit <C-R>=expand('%:p:h') . '/'<CR>

" Zoom one pane
nnoremap <silent> <Leader>z :! tmux resize-pane -Z<CR><CR> :MaximizerToggle<CR>

" Jump To Definition
nnoremap <Leader>d <C-]>
nnoremap <Leader>b <C-T>
autocmd FileType javascript nnoremap <silent> <Leader>d :TernDef<CR>
" autocmd FileType javascript nnoremap <silent> <Leader>b :TsuGoBack<CR>
autocmd FileType typescript nnoremap <silent> <Leader>d :TsuDefinition<CR>
autocmd FileType typescript nnoremap <silent> <Leader>b :TsuGoBack<CR>

" new line without insert
nnoremap <Leader>o o<esc>k
nnoremap <Leader>O O<esc>j

" Easy motion
" map <Leader>ö <Plug>(easymotion-prefix)
map <Leader>e <Plug>(easymotion-bd-w)
nmap <Leader>e <Plug>(easymotion-overwin-w)
nmap <Leader>f <Plug>(easymotion-overwin-f)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

