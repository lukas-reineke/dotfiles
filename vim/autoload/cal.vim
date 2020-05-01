
function cal#Action(day, month, year, week, dir)
    function! s:prefix_zero(num) abort
        if a:num < 10
            return '0'.a:num
        endif
        return a:num
    endfunction

    let day = s:prefix_zero(a:day)
    let month = s:prefix_zero(a:month)
    let @+ = a:year . '-' . l:month . '-' . l:day
    bdelete
endfunction
