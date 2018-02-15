setlocal completeopt-=preview
setlocal define=\\(const\\\|let\\)

nnoremap <silent> <buffer> <C-]> :normal! m`<CR>:TsuDefinition<CR>

