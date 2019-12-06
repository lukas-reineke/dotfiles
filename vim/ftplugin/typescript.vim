setlocal define=\\(const\\\|let\\\|private\\\|public\\\|class\\)
setlocal iskeyword+=$
setlocal suffixesadd+=.js,.tsx,.jsx
setlocal path+=$PWD/node_modules

" nmap <silent> <buffer> <C-]> <Plug>(TsuquyomiDefinition)<Plug>(TsuquyomiGoBack)<Plug>(TsuquyomiDefinition)
" nmap <silent> <buffer> <C-W><C-]> <Plug>(TsuquyomiSplitDefinition)
" nnoremap <silent> <buffer> <Leader>ti :TsuImport<CR>
highlight link typescriptPredefinedType EasyMotionTarget

