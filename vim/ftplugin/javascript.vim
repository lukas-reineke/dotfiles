
setlocal completeopt+=menu
setlocal completeopt-=preview
setlocal omnifunc=tern#Complete

nnoremap <silent> [D :normal! m`<CR>:TernDef<CR>

