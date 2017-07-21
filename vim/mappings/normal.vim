
" => Normal Mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Yank to end of line
nmap Y y$

" open FZF Files
nnoremap <C-p> :Files<CR>

" open nerdtree
nnoremap <silent> <C-b> :call ToggleNERDTreeFind() <CR>

" Move between panes
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" move with Uppercase hjkl
nnoremap H ^
nnoremap cH c^
nnoremap L $
nnoremap cL c$
nnoremap K 5k
nnoremap J 5j

noremap <silent> j gj
noremap <silent> k gk

" esc to clear search highlight
nnoremap <silent> <esc> :noh<cr><esc>

" Git diff
nnoremap do2 :diffget //2<CR> :diffupdate<CR>
nnoremap do3 :diffget //3<CR> :diffupdate<CR>

map <silent> w <Plug>CamelCaseMotion_w
map <silent> b <Plug>CamelCaseMotion_b
map <silent> e <Plug>CamelCaseMotion_e
map <silent> ge <Plug>CamelCaseMotion_ge
sunmap w
sunmap b
sunmap e
sunmap ge

" Incsearch
map / <Plug>(incsearch-forward)
map ? <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
map z/ <Plug>(incsearch-fuzzy-/)
map z? <Plug>(incsearch-fuzzy-?)
map zg/ <Plug>(incsearch-fuzzy-stay)
map n <Plug>(incsearch-nohl-n)
map N <Plug>(incsearch-nohl-N)
map * <Plug>(incsearch-nohl-*)N
map # <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)

nnoremap Q @q

