if exists('b:did_ftplugin')
    finish
endif

let b:did_ftplugin = 1

setlocal completeopt-=preview

nnoremap <silent> <buffer> [D :normal! m`<CR>:TernDef<CR>

