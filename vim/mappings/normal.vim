"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Normal Mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" map Uppercase to Lowercase
nmap Q q
nmap W w
nmap X x

" Yank to end of line
nmap Y y$

" open ctrlp
nmap <C-p> :CtrlPMixed

" open nerdtree
map <silent> <C-b> :NERDTreeToggle <CR>

" Move between panes
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" move with Uppercase hjkl
map H ^
map L $
map K 5k
map J 5j

" esc to clear search highlight
nnoremap <silent> <esc> :noh<cr><esc>

" Smoth Scroll
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 1, 5)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 1, 5)<CR>

" insert ; at end of line
nnoremap ; maA;<esc>`a
