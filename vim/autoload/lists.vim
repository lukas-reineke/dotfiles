
let g:active_list = 'Location'

function! lists#MoveInList(direction)
    if a:direction ==# 'up'
        try
            if g:active_list ==# 'Location'
                execute 'labove'
            elseif g:active_list ==# 'Quickfix'
                execute 'cprevious'
            endif
        catch /^Vim\%((\a\+)\)\=:E553/
            if g:active_list ==# 'Location'
                execute 'llast'
            elseif g:active_list ==# 'Quickfix'
                execute 'clast'
            endif
        catch /^Vim\%((\a\+)\)\=:E\%(776\|42\):/
        endtry
    elseif a:direction ==# 'down'
        try
            if g:active_list ==# 'Location'
                execute 'lbelow'
            elseif g:active_list ==# 'Quickfix'
                execute 'cnext'
            endif
        catch /^Vim\%((\a\+)\)\=:E553/
            if g:active_list ==# 'Location'
                execute 'lfirst'
            elseif g:active_list ==# 'Quickfix'
                execute 'cfirst'
            endif
        catch /^Vim\%((\a\+)\)\=:E\%(776\|42\):/
        endtry
    elseif a:direction ==# 'left'
        try
            if g:active_list ==# 'Location'
                execute 'lolder'
            elseif g:active_list ==# 'Quickfix'
                execute 'colder'
            endif
        catch /^Vim\%((\a\+)\)\=:E\%(380\):/
        endtry
    elseif a:direction ==# 'right'
        try
            if g:active_list ==# 'Location'
                execute 'lnewer'
            elseif g:active_list ==# 'Quickfix'
                execute 'cnewer'
            endif
        catch /^Vim\%((\a\+)\)\=:E\%(381\):/
        endtry
    endif
endfunction


function! lists#ChangeActiveList(list)
    let g:active_list = a:list
endfunction


function! lists#fzf()
    if g:active_list ==# 'Location'
        Quickfix!
    elseif g:active_list ==# 'Quickfix'
        Quickfix
    endif
endfunction

function! lists#toggle()
    if g:active_list ==# 'Location'
        let g:active_list = 'Quickfix'
    else
        let g:active_list = 'Location'
    endif
    echo g:active_list . " list"
endfunction
