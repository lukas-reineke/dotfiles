setlocal completeopt-=preview
setlocal define=\\(const\\\|let\\)
setlocal suffixesadd+=.js,.jsx
setlocal path+=$PWD/node_modules

" nnoremap <silent> <buffer> <C-]> :normal! m`<CR>:TsuDefinition<CR>
" nnoremap <silent> <buffer> <C-]> :LspDefinition<CR>

function! TestToggle(key)
    let l:view = winsaveview()
    if a:key == 'c'
        :?\v^\s*(f|x)(it|describe)
        execute "normal _x"
    else
        :?\v^\s*(it|describe)
        execute "normal I" . a:key
    endif
    call winrestview(l:view)
endfunction

nnoremap ;f :call TestToggle('f')<CR>
nnoremap ;x :call TestToggle('x')<CR>
nnoremap ;c :call TestToggle('c')<CR>
