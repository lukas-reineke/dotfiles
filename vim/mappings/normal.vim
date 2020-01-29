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

nnoremap <expr> j v:count ? (v:count > 5 ? "m'" . v:count : '') . 'j' : 'gj'
nnoremap <expr> k v:count ? (v:count > 5 ? "m'" . v:count : '') . 'k' : 'gk'

map <silent> w <Plug>CamelCaseMotion_w
map <silent> b <Plug>CamelCaseMotion_b
map <silent> e <Plug>CamelCaseMotion_e
map <silent> ge <Plug>CamelCaseMotion_ge
sunmap w
sunmap b
sunmap e
sunmap ge

nnoremap <c-w>l <c-w>5>
nnoremap <c-w>h <c-w>5<
nnoremap <c-w>k <c-w>5+
nnoremap <c-w>j <c-w>5-

nnoremap Q @q

noremap <LEFT> 5zh
noremap <RIGHT> 5zl

noremap <C-Y> 2<C-Y>
noremap <C-E> 2<C-E>

nmap gj <plug>(signify-next-hunk)
nmap gk <plug>(signify-prev-hunk)

nmap <C-]> <Plug>(coc-definition)

" }}}
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins {{{

nnoremap <C-p> :call Fzf_dev('')<CR>
" nnoremap <C-p> :Clap gfiles<CR>

nnoremap - :Defx -search=`expand('%:p')`<CR>
" nnoremap - :VimFilerCurrentDir<CR>
" nnoremap + :VimFilerBufferDir -split<CR>

nnoremap <F3> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">" . " FG:" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"fg#")<CR>

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
nnoremap [t /todo\><CR>:nohl<CR>
nnoremap ]t ?todo\><CR>:nohl<CR>

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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Fold Method {{{

function! FoldMethod()
    if &foldmethod ==# 'indent'
        setlocal foldmethod=manual
    else
        setlocal foldmethod=indent
    endif
    echo 'set foldmethod to ' . &foldmethod
endfunction

nnoremap gz :call FoldMethod()<CR>

" }}}
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Coc {{{

xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" }}}
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" vim:foldmethod=marker:foldlevel=0

