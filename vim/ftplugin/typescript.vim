setlocal define=\\(const\\\|let\\\|private\\\|public\\\|class\\)

nnoremap <silent> <buffer> [D :normal! m`<CR>:TsuDefinition<CR>
nnoremap <silent> <buffer> <Leader>ti :TsuImport<CR>

