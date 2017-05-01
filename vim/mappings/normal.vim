"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Normal Mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" map Uppercase to Lowercase
nmap Q q
nmap W w
nmap X x

" Yank to end of line
nmap Y y$

" open FZF Files
nmap <C-p> :Files<CR>

" open nerdtree
map <silent> <C-b> :call ToggleNERDTreeFind() <CR>

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

" Git diff
nnoremap do2 :diffget //2<CR> :diffupdate<CR>
nnoremap do3 :diffget //3<CR> :diffupdate<CR>

nnoremap ö [
nnoremap ä ]

map <silent> w <Plug>CamelCaseMotion_w
map <silent> b <Plug>CamelCaseMotion_b
map <silent> e <Plug>CamelCaseMotion_e
map <silent> ge <Plug>CamelCaseMotion_ge
sunmap w
sunmap b
sunmap e
sunmap ge

" Change inside surround
nnoremap cic :ChangeInsideSurrounding<CR>

" Incsearch
map / <Plug>(incsearch-forward)
map ? <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
map z/ <Plug>(incsearch-fuzzy-/)
map z? <Plug>(incsearch-fuzzy-?)
map zg/ <Plug>(incsearch-fuzzy-stay)
map n <Plug>(incsearch-nohl-n)
map N <Plug>(incsearch-nohl-N)
map * <Plug>(incsearch-nohl-*)
map # <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)

