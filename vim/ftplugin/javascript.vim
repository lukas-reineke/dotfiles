
setlocal completeopt+=menu
setlocal completeopt-=preview
setlocal omnifunc=tern#Complete

nnoremap <silent> <buffer> [D :normal! m`<CR>:TernDef<CR>

