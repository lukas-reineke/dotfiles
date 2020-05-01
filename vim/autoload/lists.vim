
let g:active_list = 'quickfix'

function! lists#WrapCommand(direction, prefix)
    if a:direction ==# 'up'
        try
            execute a:prefix . 'previous'
        catch /^Vim\%((\a\+)\)\=:E553/
            execute a:prefix . 'last'
        catch /^Vim\%((\a\+)\)\=:E\%(776\|42\):/
        endtry
    elseif a:direction ==# 'down'
        try
            execute a:prefix . 'next'
        catch /^Vim\%((\a\+)\)\=:E553/
            execute a:prefix . 'first'
        catch /^Vim\%((\a\+)\)\=:E\%(776\|42\):/
        endtry
    endif
endfunction

function! lists#MoveInList(direction)
    if g:active_list ==# 'ale'
        if a:direction ==# 'up'
            ALEPreviousWrap
        elseif a:direction ==# 'down'
            ALENextWrap
        endif
    elseif g:active_list ==# 'location'
        call lists#WrapCommand(a:direction, 'l')
    elseif g:active_list ==# 'quickfix'
        call lists#WrapCommand(a:direction, 'c')
    endif
endfunction


function! lists#ChangeActiveList(list)
    let g:active_list = a:list
endfunction

