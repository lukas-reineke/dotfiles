
function! quickfix#Build(lines)
    call setqflist(map(copy(a:lines), '{ "filename": v:val, "lnum": 1, "col": 1 }'))
    copen
    cc
endfunction
