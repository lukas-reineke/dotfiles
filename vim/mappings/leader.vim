"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Leader Mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let mapleader = "\<Space>"


" switch to last buffer
nnoremap <Leader><Leader> <C-^>

" CtrlP
" nnoremap <Leader>p :CtrlPBuffer<CR>
nnoremap <Leader>p :Buffers<CR>
" nnoremap <Leader><C-P> :CtrlPBookmarkDir<CR>
nnoremap <Leader><C-P> :call fzf#run({'source': '~/dotfiles/scripts/bookmarks.sh', 'sink': ':Files'})<CR>


nnoremap <Leader><C-H> :hide<CR>
nnoremap <Leader><C-J> :only<CR>
nnoremap <Leader><C-K> :sv#<CR>
nnoremap <Leader><C-L> :vs#<CR>

" save/close
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :call CloseOnLast()<CR>
nnoremap <Leader>x :x<CR>

" open from dir
nnoremap <Leader>n :Files %:h<CR>

" Search all
nnoremap <Leader>a :RG<Space>

" Zoom one pane
nnoremap <silent> <Leader>z :! tmux resize-pane -Z<CR><CR> :MaximizerToggle<CR>

" Jump To Definition
nnoremap <Leader>d <C-]>
nnoremap <Leader>b <C-T>
autocmd FileType javascript nnoremap <silent> <Leader>d :TernDef<CR>
autocmd FileType typescript nnoremap <silent> <Leader>d :TsuDefinition<CR>
autocmd FileType typescript nnoremap <silent> <Leader><C-d> :TsuReferences<CR>
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

" Spell correct
nnoremap <Leader>z 1z=

" Undo Tree
nnoremap <Leader>u :UndotreeToggle<CR>

" Eslint
nnoremap <Leader>h :Autoformat<CR>

" Tool Tipp Typescript
autocmd FileType typescript nmap <buffer> <Leader>t : <C-u>echo tsuquyomi#hint()<CR>

" Merginal
nnoremap <Leader>g :Merginal<CR>

