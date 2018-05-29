"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim overwrite {{{

nmap Y y$

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

nnoremap H ^
onoremap H ^
nnoremap L $
onoremap L $

nnoremap zl 20zl
nnoremap zh 20zh

noremap <silent> j gj
noremap <silent> k gk

map <silent> w <Plug>CamelCaseMotion_w
map <silent> b <Plug>CamelCaseMotion_b
map <silent> e <Plug>CamelCaseMotion_e
map <silent> ge <Plug>CamelCaseMotion_ge
sunmap w
sunmap b
sunmap e
sunmap ge

nnoremap <silent> <esc> :noh<cr><esc>

nnoremap Q @q

" make mark and jump to last insert
nnoremap gV m``[v`]

noremap <Up> :move-2<CR>==
noremap <Down> :move+1<CR>==

function! FixIndentation()
    let l:view = winsaveview()
    normal gg=G
    call winrestview(l:view)
endfunction

nnoremap =+ :call FixIndentation()<CR>

nmap gj <plug>(signify-next-hunk)
nmap gk <plug>(signify-prev-hunk)

nnoremap 1% 10%
nnoremap 2% 20%
nnoremap 3% 30%
nnoremap 4% 40%
nnoremap 5% 50%
nnoremap 6% 60%
nnoremap 7% 70%
nnoremap 8% 80%
nnoremap 9% 90%

" }}}
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins {{{

nnoremap <C-p> :Files<CR>

nnoremap - :VimFilerCurrentDir<CR>
nnoremap + :VimFilerBufferDir -split<CR>

" }}}
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Fold Movement {{{
function! s:SkipFold(direction) abort
    let l:pos = getpos('.')
    let l:posOrig = getpos('.')
    if a:direction
        let l:pos[1] = l:pos[1] + 5
        if l:pos[1] >= line('w$')
            let l:pos[1] = line('w$')
        endif
        call cursor(l:pos[1:])
    else
        let l:pos[1] = l:pos[1] - 5
        if l:pos[1] < 1
            let l:pos[1] = 1
        endif
        call cursor(l:pos[1:])
    endif

    let l:currentLine = line('.')

    while foldclosed(l:currentLine) != -1

        if a:direction
            let l:pos[1] = l:pos[1] + 1
            call cursor(l:pos[1:])
        else
            let l:pos[1] = l:pos[1] - 1
            call cursor(l:pos[1:])
        endif

        if l:pos[1] == line('w$')
            let l:posOrig[1] = l:posOrig[1] + 5
            call cursor(l:posOrig[1:])
            break
        elseif l:pos[1] == 0
            let l:posOrig[1] = l:posOrig[1] - 5
            call cursor(l:posOrig[1:])
            break
        endif

        let l:currentLine = line('.')
    endwhile
endfunction

nnoremap <silent>J :call <SID>SkipFold(1)<cr>
nnoremap <silent>K :call <SID>SkipFold(0)<cr>


function! NextClosedFold(dir)
    let l:cmd = 'norm!z' . a:dir
    let l:view = winsaveview()
    let [l:l0, l:l, l:open] = [0, l:view.lnum, 1]
    while l:l != l:l0 && l:open
        exe l:cmd
        let [l:l0, l:l] = [l:l, line('.')]
        let l:open = foldclosed(l:l) < 0
    endwhile
    if l:open
        call winrestview(l:view)
    endif
endfunction

nnoremap <silent> zj :call NextClosedFold('j')<cr>
nnoremap <silent> zk :call NextClosedFold('k')<cr>zo[z

" }}}
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Git {{{
"
nnoremap do2 :diffget //2<CR> :diffupdate<CR>
nnoremap do3 :diffget //3<CR> :diffupdate<CR>
omap ic <plug>(signify-motion-inner-pending)
xmap ic <plug>(signify-motion-inner-visual)
omap ac <plug>(signify-motion-outer-pending)
xmap ac <plug>(signify-motion-outer-visual)

" }}}
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Incsearch {{{

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

" }}}
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" [ Mappings {{{

nnoremap [[ ?[<CR>:nohl<CR>
nnoremap ]] /]<CR>:nohl<CR>
nnoremap [t ?<<CR>:nohl<CR>
nnoremap ]t /<<CR>:nohl<CR>

function! WrapCommand(direction, prefix)
    if a:direction ==# 'up'
        try
            execute a:prefix . 'previous'
            execute a:prefix . 'last'
        catch /^Vim\%((\a\+)\)\=:E553/
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

nnoremap <silent> ]l :call WrapCommand('up', 'l')<CR>
nnoremap <silent> [l  :call WrapCommand('down', 'l')<CR>

nnoremap <silent> ]c :call WrapCommand('up', 'c')<CR>
nnoremap <silent> [c  :call WrapCommand('down', 'c')<CR>

" }}}
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Paste {{{

nmap <CLEAR-1> <Plug>UnconditionalPasteLineAfter
nmap <CLEAR-2> <Plug>UnconditionalPasteLineBefore
nmap <CLEAR-3> <Plug>UnconditionalPasteCommaAfter
nmap <CLEAR-4> <Plug>UnconditionalPasteCommaBefore
nmap <CLEAR-5> <Plug>UnconditionalPasteCommaSingleQuoteAfter
nmap <CLEAR-6> <Plug>UnconditionalPasteCommaSingleQuoteBefore
nmap glp <Plug>UnconditionalPasteIndentedAfter<ESC>ddP
nmap glP <Plug>UnconditionalPasteIndentedBefore
nnoremap gco m'yyp:Commentary<CR>`'

" }}}
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Replace {{{

nmap grr <Plug>ReplaceWithSameIndentRegisterLine
nmap grR <Plug>ReplaceWithRegisterLine
nmap gr <Plug>ReplaceWithRegisterOperator

" }}}
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" vim:foldmethod=marker:foldlevel=0

