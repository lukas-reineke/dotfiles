
function! markdown#FoldExpression(lnum)

    let l:marker = &filetype ==# 'markdown' ? '#' : '='
    let l:markers = strlen(matchstr(getline(a:lnum), '^' . l:marker . '\+'))

    if (l:markers)
        return '>' . l:markers
    endif

    if getline(a:lnum) =~? '\v^\s*$'
        if (strlen(matchstr(getline(a:lnum + 1), '^' . l:marker . '\+')))
            return '-1'
        endif
    endif
    return '='
endfunction

