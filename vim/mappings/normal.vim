"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim overwrite {{{

nmap Y y$

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

nnoremap H ^
nnoremap cH c^
nnoremap L $
nnoremap cL c$

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

" }}}
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins {{{

nnoremap <C-p> :Files<CR>
nnoremap <C-]> :A<CR>

" function! ToggleNERDTreeFind()
"     if exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
"         NERDTreeClose
"     else
"         NERDTreeFind
"     endif
" endfunction
" nnoremap <silent> <C-b> :call ToggleNERDTreeFind() <CR>

let g:NetrwIsOpen=0
function! ToggleNetrw()
    if g:NetrwIsOpen
        let i = bufnr('$')
        while (i >= 1)
            if (getbufvar(i, '&filetype') == 'netrw')
                silent exe 'bwipeout! ' . i
            endif
            let i-=1
        endwhile
        let g:NetrwIsOpen=0
    else
        let g:NetrwIsOpen=1
        silent Sexplore
    endif
endfunction

nnoremap <silent> <C-b> :call ToggleNetrw()<CR>

" }}}
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Fold Movement {{{
function! s:SkipFold(direction) abort
    let l:pos = getpos('.')
    let l:posOrig = getpos('.')
    if a:direction
        let l:pos[1] = l:pos[1] + 5
        if l:pos[1] >= line("w$")
            let l:pos[1] = line("w$")
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

        if l:pos[1] == line("w$")
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
    let cmd = 'norm!z' . a:dir
    let view = winsaveview()
    let [l0, l, open] = [0, view.lnum, 1]
    while l != l0 && open
        exe cmd
        let [l0, l] = [l, line('.')]
        let open = foldclosed(l) < 0
    endwhile
    if open
        call winrestview(view)
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

" }}}
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Incsearch {{{

map / <Plug>(incsearch-forward)\v
map ? <Plug>(incsearch-backward)\v
map g/ <Plug>(incsearch-stay)\v
map z/ <Plug>(incsearch-fuzzy-/)\v
map z? <Plug>(incsearch-fuzzy-?)\v
map zg/ <Plug>(incsearch-fuzzy-stay)\v
map n <Plug>(incsearch-nohl-n)
map N <Plug>(incsearch-nohl-N)
map * <Plug>(incsearch-nohl-*)N
map # <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)

" }}}
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" [ Mappings {{{

nnoremap [[ ?[<CR>:nohl<CR>
nnoremap ]] /]<CR>:nohl<CR>
nnoremap [t ?<<CR>:nohl<CR>
nnoremap ]t /<<CR>:nohl<CR>

function! WrapCommand(direction, prefix)
    if a:direction == "up"
        try
            execute a:prefix . "previous"
        catch /^Vim\%((\a\+)\)\=:E553/
            execute a:prefix . "last"
        catch /^Vim\%((\a\+)\)\=:E\%(776\|42\):/
        endtry
    elseif a:direction == "down"
        try
            execute a:prefix . "next"
        catch /^Vim\%((\a\+)\)\=:E553/
            execute a:prefix . "first"
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
" nmap g#p <ESC>o<C-W><ESC>gcpddk<Plug>UnconditionalPasteCommentedAfter
" nmap g#P <ESC>o<C-W><ESC>gcpddk<Plug>UnconditionalPasteCommentedBefore
nmap gjp <Plug>UnconditionalPasteCommaAfter
nmap gjP <Plug>UnconditionalPasteCommaBefore
nmap gj'p <Plug>UnconditionalPasteCommaSingleQuoteAfter
nmap gj'P <Plug>UnconditionalPasteCommaSingleQuoteBefore
nnoremap gco m'yyp:Commentary<CR>`'

" }}}
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Replace {{{

nmap grr <Plug>ReplaceWithSameIndentRegisterLine
nmap grR <Plug>ReplaceWithRegisterLine
nmap grL <Plug>ReplaceWithRegisterOperator$
nmap grH <Plug>ReplaceWithRegisterOperator^
nmap gr <Plug>ReplaceWithRegisterOperator

" }}}
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" vim:foldmethod=marker:foldlevel=0

