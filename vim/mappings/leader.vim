"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Global {{{

let g:mapleader = "\<Space>"

nnoremap <silent><Leader><Leader> :<C-u>exe v:count ? v:count . 'b' : 'b' . (bufloaded(0) ? '#' : 'n')<CR>

nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :call CloseOnLast()<CR>
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

" }}}
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" FZF {{{

nnoremap <Leader>p :Buffers<CR>
nnoremap <Leader>P :Rg<CR>
nnoremap <Leader><C-P> :Commands<CR>
nnoremap <Leader><C-W> :Windows<CR>
nnoremap <Leader>n :Files %:h<CR>
nmap <Leader>[ :Quickfix<CR>

" nnoremap <Leader>n :exec "Clap files " . expand('%:h')<CR>
" nnoremap <Leader>p :Clap buffers<CR>
" nnoremap <Leader>P :Clap grep<CR>
" nnoremap <Leader><C-P> :Clap command<CR>
" nnoremap <Leader><C-R> :Clap registers<CR>
" nnoremap <Leader>M :Clap marks<CR>
" nnoremap <Leader>[ :Clap quickfix<CR>

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
vnoremap <Leader>r :s/\v()

nnoremap <Leader>x :CtrlSF<Space>
nnoremap <Leader>a :call ChangeActiveList('quickfix')<CR>:Ack<Space>

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

nnoremap <Leader>gd :Gvdiff<CR>
nnoremap <Leader>gr :Gread<CR>
nnoremap <Leader>gb :Gblame<CR>
nnoremap <Leader>gs :Gstatus<CR><C-w>o
nnoremap <Leader>gl :BCommits<CR>
nnoremap <Leader>gf :GFiles?<CR>
" nnoremap <Leader>gf :Clap git_diff_files<CR>
nnoremap <Leader>gt :SignifyToggleHighlight<CR>
nnoremap <Leader>gz :SignifyFold!<CR>
nnoremap <Leader>gc :Twiggy<CR>
nnoremap <Leader>gu :GitGutterUndoHunk<CR>
nnoremap <Leader>ga :GitGutterStageHunk<CR>:SignifyRefresh<CR>
nnoremap <Leader>gg :VcsJump diff<CR>:call ChangeActiveList('quickfix')<CR>
nnoremap <Leader>gn :VcsJump merge<CR>:call ChangeActiveList('quickfix')<CR>
nmap <Leader>gw <Plug>(git-messenger)
nmap <Leader>gi <Plug>(git-messenger-into-popup)

" }}}
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Google {{{

function! s:goog(pat, lucky)
    let l:q = '"'.substitute(a:pat, '["\n]', ' ', 'g').'"'
    let l:q = substitute(l:q, '[[:punct:] ]',
                \ '\=printf("%%%02X", char2nr(submatch(0)))', 'g')
    call system(printf('open "https://www.google.com/search?%sq=%s"',
                \ a:lucky ? 'btnI&' : '', l:q))
endfunction

nnoremap <leader>? :call <SID>goog(expand("<cWORD>"), 0)<cr>
nnoremap <leader>! :call <SID>goog(expand("<cWORD>"), 1)<cr>

" }}}
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Marks {{{

nnoremap <leader>m :call ChangeActiveList('location')<CR>:SignatureListGlobalMarks<CR>

" }}}
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Coc {{{

function! CocFzf()
    let l:options = [
        \ 'doHover',
        \ 'rename',
        \ 'codeAction',
        \ 'codeLensAction',
        \ 'highlight',
        \ 'jumpReferences',
        \ 'jumpImplementation',
        \ 'quickfixes',
    \ ]

    call fzf#run({
    \   'source': l:options,
    \   'sink': function('CocAction'),
    \   'down': len(l:options) + 2
    \})
endfunction

nnoremap <Leader><CR> :call CocFzf()<CR>
xnoremap <Leader><CR> :call CocFzf()<CR>

" }}}
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Lists {{{

let g:active_list = 'quickfix'

function! ChangeActiveList(list)
    let g:active_list = a:list
endfunction

nnoremap <Leader>ic :call ChangeActiveList('quickfix')<CR>
nnoremap <Leader>iv :call ChangeActiveList('location')<CR>
nnoremap <Leader>ib :call ChangeActiveList('ale')<CR>

function! WrapCommand(direction, prefix)
    if a:direction ==# 'up'
        try
            execute a:prefix . 'previous'
        catch /^Vim\%((\a\+)\)\=:E553/
            execute a:prefix . 'last'
        catch /^Vim\%((\a\+)\)\=:E\%(776\|42\):/
        endtry
    elseif a:direction ==# 'down'
        try
            execute a:prefix . 'next'
        catch /^Vim\%((\a\+)\)\=:E553/
            execute a:prefix . 'first'
        catch /^Vim\%((\a\+)\)\=:E\%(776\|42\):/
        endtry
    endif
endfunction

nnoremap <silent> ]c :call WrapCommand('up', 'c')<CR>
nnoremap <silent> [c  :call WrapCommand('down', 'c')<CR>

nnoremap <silent> ]v :call WrapCommand('up', 'l')<CR>
nnoremap <silent> [v  :call WrapCommand('down', 'l')<CR>

nnoremap [b :ALENextWrap<CR>
nnoremap ]b :ALEPreviousWrap<CR>


function! MoveInList(direction)
    if g:active_list ==# 'ale'
        if a:direction ==# 'up'
            ALEPreviousWrap
        elseif a:direction ==# 'down'
            ALENextWrap
        endif
    elseif g:active_list ==# 'location'
        call WrapCommand(a:direction, 'l')
    elseif g:active_list ==# 'quickfix'
        call WrapCommand(a:direction, 'c')
    endif
endfunction

noremap <silent> <Up> :call MoveInList('up')<CR>
noremap <silent> <Down> :call MoveInList('down')<CR>

nmap <silent> <Leader>c <Plug>(qf_qf_toggle_stay):call ChangeActiveList('quickfix')<CR>
nmap <silent> <Leader>v <Plug>(qf_loc_toggle_stay):call ChangeActiveList('location')<CR>
nnoremap <Leader>b :call ChangeActiveList('ale')<CR>

" }}}
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim:foldmethod=marker:foldlevel=0

