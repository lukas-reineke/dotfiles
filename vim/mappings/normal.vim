
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

nnoremap zj L
nnoremap zk H
nnoremap zl 20zl
nnoremap zh 20zh

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
map / <Plug>(incsearch-forward)\v
map ? <Plug>(incsearch-backward)\v
map g/ <Plug>(incsearch-stay)\v
map z/ <Plug>(incsearch-fuzzy-/)\v
map z? <Plug>(incsearch-fuzzy-?)\v
map zg/ <Plug>(incsearch-fuzzy-stay)\v
map n <Plug>(incsearch-nohl-n)zz<Plug>Pulse
map N <Plug>(incsearch-nohl-N)zz<Plug>Pulse
map * <Plug>(incsearch-nohl-*)N<Plug>Pulse
map # <Plug>(incsearch-nohl-#)<Plug>Pulse
map g* <Plug>(incsearch-nohl-g*)<Plug>Pulse
map g# <Plug>(incsearch-nohl-g#)<Plug>Pulse

nnoremap Q @q

" paste
nmap <CLEAR-1> <Plug>UnconditionalPasteLineAfter
nmap <CLEAR-2> <Plug>UnconditionalPasteLineBefore
nmap <CLEAR-3> <Plug>UnconditionalPasteCommaAfter
nmap <CLEAR-4> <Plug>UnconditionalPasteCommaBefore
nmap <CLEAR-5> <Plug>UnconditionalPasteCommaSingleQuoteAfter
nmap <CLEAR-6> <Plug>UnconditionalPasteCommaSingleQuoteBefore
nmap glp <Plug>UnconditionalPasteIndentedAfter<ESC>ddP
nmap glP <Plug>UnconditionalPasteIndentedBefore
nmap g#p <ESC>o<C-W><ESC>gcpddk<Plug>UnconditionalPasteCommentedAfter
nmap g#P <ESC>o<C-W><ESC>gcpddk<Plug>UnconditionalPasteCommentedBefore
nmap gjp <Plug>UnconditionalPasteCommaAfter
nmap gjP <Plug>UnconditionalPasteCommaBefore
nmap gj'p <Plug>UnconditionalPasteCommaSingleQuoteAfter
nmap gj'P <Plug>UnconditionalPasteCommaSingleQuoteBefore

" replace
nmap grr <Plug>ReplaceWithSameIndentRegisterLine
nmap grR <Plug>ReplaceWithRegisterLine
nmap grL <Plug>ReplaceWithRegisterOperator$
nmap grH <Plug>ReplaceWithRegisterOperator^
nmap gr <Plug>ReplaceWithRegisterOperator

