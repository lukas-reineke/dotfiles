setlocal completeopt-=preview
setlocal iskeyword+=$
setlocal define=\\(const\\\|let\\)
setlocal suffixesadd+=.js,.jsx
setlocal path+=$PWD/node_modules

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
