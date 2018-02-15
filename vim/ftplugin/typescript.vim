setlocal define=\\(const\\\|let\\\|private\\\|public\\\|class\\)

nmap <silent> <buffer> <C-]> <Plug>(TsuquyomiDefinition)<Plug>(TsuquyomiGoBack)<Plug>(TsuquyomiDefinition)
nmap <silent> <buffer> <C-W><C-]> <Plug>(TsuquyomiSplitDefinition)
nnoremap <silent> <buffer> <Leader>ti :TsuImport<CR>

