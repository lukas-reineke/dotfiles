setlocal completeopt-=preview
setlocal define=\\(const\\\|let\\)
setlocal suffixesadd+=.js,.jsx
setlocal path+=$PWD/node_modules

" nnoremap <silent> <buffer> <C-]> :normal! m`<CR>:TsuDefinition<CR>
" nnoremap <silent> <buffer> <C-]> :LspDefinition<CR>

