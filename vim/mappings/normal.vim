"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim overwrite {{{

nmap Y y$

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap <C-LEFT> :vertical resize +5<CR>
nnoremap <C-RIGHT> :vertical resize -5<CR>
nnoremap <C-UP> :resize +5<CR>
nnoremap <C-DOWN> :resize -5<CR>

nnoremap } {
nnoremap { }

nnoremap ( gT
nnoremap ) gt


nnoremap H ^
onoremap H ^
nnoremap L $
onoremap L $

nnoremap zl 20zl
nnoremap zh 20zh

nnoremap x "_x

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

noremap <C-Y> 2<C-Y>
noremap <C-E> 2<C-E>

nmap gj <Plug>(GitGutterNextHunk)
nmap gk <Plug>(GitGutterPrevHunk)

nmap s <Nop>
xmap s <Nop>

nmap gx <Plug>(openbrowser-smart-search)
vmap gx <Plug>(openbrowser-smart-search)

" }}}
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins {{{

nnoremap <C-p> :call fzf#files#Run('')<CR>

nnoremap - :Defx -show-ignored-files -search=`expand('%:p')`<CR>

nnoremap <F3> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">" . " FG:" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"fg#")<CR>

" }}}
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Fold Movement {{{

nnoremap <silent>J :call movement#SkipFold(1)<cr>
nnoremap <silent>K :call movement#SkipFold(0)<cr>

nnoremap <silent> zj :call fold#NextClosedFold('j')<cr>
nnoremap <silent> zk :call fold#NextClosedFold('k')<cr>zo[z

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
map g* <Plug>(incsearch-nohl-g*)N
map g# <Plug>(incsearch-nohl-g#)

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
nmap <CLEAR-7> <Plug>VimwikiIncrementListItem
nmap <CLEAR-8> <Plug>VimwikiDecrementListItem
nmap glp <Plug>UnconditionalPasteIndentedAfter
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

