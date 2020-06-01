setlocal nowrap
setlocal spell
setlocal nolist
setlocal colorcolumn=

setlocal foldnestmax=20
setlocal foldexpr=markdown#FoldExpression(v:lnum)
setlocal foldmethod=expr

UltiSnipsAddFiletypes markdown.vimwiki.javascript

nmap <buffer> <TAB> <Plug>VimwikiNextLink
nmap <buffer> <S-TAB> <Plug>VimwikiPrevLink
nmap <buffer> = <Plug>VimwikiAddHeaderLevel
nmap <buffer> + <Plug>VimwikiRemoveHeaderLevel
nmap <buffer> _ <Plug>VimwikiNormalizeLink
nmap <buffer> <C-LEFT> <Plug>VimwikiTableMoveColumnLeft
nmap <buffer> <C-RIGHT> <Plug>VimwikiTableMoveColumnRight
nmap <buffer> <C-]> <C-]>
inoremap <buffer> <C-O> <C-X><C-O>


nnoremap <buffer> <leader>f :VimwikiHeadersFzf<CR>
nmap <buffer> <Leader>w <Plug>VimwikiRenumberAllLists:w<CR>

let g:AutoPairs['_'] = '_'
let g:AutoPairsDelete['_'] = '_'

