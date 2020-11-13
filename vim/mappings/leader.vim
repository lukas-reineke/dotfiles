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

" nnoremap <Leader>u :UndotreeToggle<CR>:UndotreeFocus<CR>

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
" nmap <leader>rn <Plug>(coc-rename)
" vmap <leader>a <Plug>(coc-codeaction-selected)

" }}}
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Search {{{

nnoremap <Leader>rr :%s/\v()
nnoremap <Leader>R :let v=winsaveview()<CR>:%s/\<<C-R><C-W>\>//g
            \ <Bar>:call winrestview(v)<C-Left><C-Left><Left><Left><Left>a<BS>
xnoremap <Leader>rr :s/\v%V()

" nnoremap <Leader>x :CtrlSF<Space>
nnoremap <Leader>a :call lists#ChangeActiveList('Quickfix')<CR>:Ack<Space>

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
" nnoremap <Leader>gc :Twiggy<CR>
nmap <Leader>gu <Plug>(GitGutterUndoHunk)
nmap <Leader>ga <Plug>(GitGutterStageHunk)
nnoremap <Leader>gg :call lists#ChangeActiveList('Quickfix')<CR>:execute "VcsJump diff " .. g:gitHead<CR>
nnoremap <Leader>gn :call lists#ChangeActiveList('Quickfix')<CR>:VcsJump merge<CR>
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

nnoremap <leader>m :call lists#ChangeActiveList('Location')<CR>:SignatureListGlobalMarks<CR>

" }}}
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Coc {{{

" nnoremap <Leader><CR> :call fzf#coc#Actions()<CR>
" xnoremap <Leader><CR> :call fzf#coc#Actions()<CR>
nnoremap <Leader><CR> :lua vim.lsp.util.show_line_diagnostics()<CR>

" }}}
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Lists {{{

nnoremap <Leader>ic :call lists#ChangeActiveList('Quickfix')<CR>
nnoremap <Leader>iv :call lists#ChangeActiveList('Location')<CR>

noremap <silent> <Up> :call lists#MoveInList('up')<CR>
noremap <silent> <Down> :call lists#MoveInList('down')<CR>
noremap <silent> <Left> :call lists#MoveInList('left')<CR>
noremap <silent> <Right> :call lists#MoveInList('right')<CR>

nmap <silent> <Leader>c <Plug>(qf_qf_toggle_stay):call lists#ChangeActiveList('Quickfix')<CR>
nmap <silent> <Leader>v <Plug>(qf_loc_toggle_stay):call lists#ChangeActiveList('Location')<CR>
nnoremap <Leader>b :call fzf#lists#Change()<CR>

" }}}
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim:foldmethod=marker:foldlevel=0

