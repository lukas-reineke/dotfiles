setlocal nowrap
setlocal spell
setlocal nolist
setlocal colorcolumn=

setlocal foldnestmax=20
setlocal foldexpr=markdown#FoldExpression(v:lnum)
setlocal foldmethod=expr

UltiSnipsAddFiletypes markdown.vimwiki.javascript

nmap <buffer> = <Plug>VimwikiAddHeaderLevel
nmap <buffer> + <Plug>VimwikiRemoveHeaderLevel
nmap <buffer> _ <Plug>VimwikiNormalizeLink
nmap <buffer> <C-]> <C-]>


nmap <buffer> <Leader>w <Plug>VimwikiRenumberAllLists:w<CR>
