"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Global {{{

let g:mapleader = "\<Space>"

nnoremap <silent><Leader><Leader> :<C-u>exe v:count ? v:count . 'b' : 'b' . (bufloaded(0) ? '#' : 'n')<CR>

nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :call buffers#CloseOnLast()<CR>
nnoremap <Leader>Q :q<CR>
nnoremap <Leader><C-O> :Bufonly<CR>

nnoremap <Leader>N :e %:h/

nnoremap <Leader>o o<esc>k
nnoremap <Leader>O O<esc>j

nnoremap <Leader>H H
nnoremap <Leader>L L
nnoremap <Leader>K HzzH
nnoremap <Leader>J LzzL

nnoremap <Leader>z 1z=

nnoremap <Leader>it :IstanbulToggle<CR>
nnoremap <Leader>iu :IstanbulUpdate<CR>

nnoremap <Leader>u :UndotreeToggle<CR>:UndotreeFocus<CR>

nnoremap <Leader>tn :tabnew<CR>

nnoremap <Leader>s :SpellToggle<CR>

" }}}
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" FZF {{{

nnoremap <Leader>p :Buffers<CR>
nnoremap <Leader>P :RG<CR>
nnoremap <Leader><C-P> :Commands<CR>
nnoremap <C-W><Leader> :Windows<CR>
nnoremap <Leader><C-h> :Helptags<CR>
nnoremap <Leader>n :call fzf#files#Run(expand('%:h'))<CR>
nmap <Leader>[ :Quickfix<CR>
nnoremap <Leader>M :Marks<CR>

nnoremap <Leader>f :Vista finder<CR>
nnoremap <Leader>d :Vista!!<CR>
nmap <leader>rn <Plug>(coc-rename)
vmap <leader>a <Plug>(coc-codeaction-selected)

" }}}
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Search {{{

nnoremap <Leader>r :%s/\v()
nnoremap <Leader>R :let v=winsaveview()<CR>:%s/\<<C-R><C-W>\>//g
            \ <Bar>:call winrestview(v)<C-Left><C-Left><Left><Left><Left>a<BS>
xnoremap <Leader>r :s/\v%V()

" nnoremap <Leader>x :CtrlSF<Space>
nnoremap <Leader>a :call lists#ChangeActiveList('quickfix')<CR>:Ack<Space>

" }}}
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Easy Motion {{{

map <Leader>ee <Plug>(easymotion-bd-w)
nmap <Leader>ee <Plug>(easymotion-overwin-w)
nmap <Leader>ef <Plug>(easymotion-overwin-f2)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>h <Plug>(easymotion-linebackward)

" }}}
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Git {{{

nnoremap <Leader>gd :execute "Gvdiff " .. g:gitHead<CR>
nnoremap <Leader>gr :Gread<CR>
nnoremap <Leader>gb :Gblame<CR>
nnoremap <Leader>gs :Gstatus<CR><C-w>o
nnoremap <Leader>gc :BCommits<CR>
nnoremap <Leader>gf :GFiles?<CR>
nnoremap <Leader>gf :call fzf#files#Run('git')<CR>
nnoremap <Leader>gt :SignifyToggleHighlight<CR>
nnoremap <Leader>gz :SignifyFold!<CR>
" nnoremap <Leader>gc :Twiggy<CR>
nnoremap <Leader>gu :SignifyHunkUndo<CR>
nnoremap <Leader>ga :GitGutterStageHunk<CR>:SignifyRefresh<CR>
nnoremap <Leader>gg :call lists#ChangeActiveList('quickfix')<CR>:execute "VcsJump diff " .. g:gitHead<CR>
nnoremap <Leader>gn :call lists#ChangeActiveList('quickfix')<CR>:VcsJump merge<CR>
nnoremap <Leader>gh :diffget //2<CR> :diffupdate<CR>
nnoremap <Leader>gl :diffget //3<CR> :diffupdate<CR>
nmap <Leader>gw <Plug>(git-messenger)
nmap <Leader>gi <Plug>(git-messenger-into-popup)

" }}}
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" search {{{

nnoremap <leader>? :call search#DuckDuckGo(expand("<cword>"))<cr>

" }}}
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Marks {{{

nnoremap <leader>m :call lists#ChangeActiveList('location')<CR>:SignatureListGlobalMarks<CR>

" }}}
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Coc {{{

nnoremap <Leader><CR> :call fzf#coc#Actions()<CR>
xnoremap <Leader><CR> :call fzf#coc#Actions()<CR>

" }}}
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Lists {{{

nnoremap <Leader>ic :call lists#ChangeActiveList('quickfix')<CR>
nnoremap <Leader>iv :call lists#ChangeActiveList('location')<CR>
nnoremap <Leader>ib :call lists#ChangeActiveList('ale')<CR>

noremap <silent> <Up> :call lists#MoveInList('up')<CR>
noremap <silent> <Down> :call lists#MoveInList('down')<CR>

nmap <silent> <Leader>c <Plug>(qf_qf_toggle_stay):call lists#ChangeActiveList('quickfix')<CR>
nmap <silent> <Leader>v <Plug>(qf_loc_toggle_stay):call lists#ChangeActiveList('location')<CR>
nnoremap <Leader>b :call lists#ChangeActiveList('ale')<CR>

" }}}
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim:foldmethod=marker:foldlevel=0

