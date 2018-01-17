setlocal completeopt-=preview
setlocal define=\\(const\\\|let\\)

nnoremap <silent> <buffer> [D :normal! m`<CR>:TernDef<CR>

