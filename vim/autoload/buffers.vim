
function! buffers#OpenBufferNumber()
    let l:count = 0
    for l:i in range(0, bufnr('$'))
        if buflisted(l:i)
            let l:count += 1
        endif
    endfor
    return l:count
endfunction

function! buffers#CloseOnLast()
    if buffers#OpenBufferNumber() <= 1
        q
    else
        bd
    endif
endfunction
