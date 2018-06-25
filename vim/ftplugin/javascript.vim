setlocal completeopt-=preview
setlocal define=\\(const\\\|let\\)
setlocal suffixesadd+=.js

nnoremap <silent> <buffer> <C-]> :normal! m`<CR>:TsuDefinition<CR>

