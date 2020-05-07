
function! quickfix#Build(lines)
    call setqflist(map(copy(a:lines), '{ "filename": v:val, "lnum": 1, "col": 1 }'))
    copen
    cc
endfunction


function! quickfix#RemoveItem()
    let curqfidx = line('.') - 1
    let qfall = getqflist()
    call remove(qfall, curqfidx)
    call setqflist(qfall, 'r')
    execute curqfidx + 1 . 'cfirst'
    copen
endfunction

