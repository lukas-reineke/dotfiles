if exists('b:did_ftplugin')
    finish
endif

let b:did_ftplugin = 1

nnoremap <silent> <buffer> [D :normal! m`<CR>:TsuDefinition<CR>
nnoremap <silent> <buffer> <Leader>ti :TsuImport<CR>

