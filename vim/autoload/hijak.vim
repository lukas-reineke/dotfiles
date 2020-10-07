
function! hijak#OpenDefx(path) abort
    let path = a:path
    if fnamemodify(path, ':t') ==# '~'
        let path = '~'
    endif

    if !isdirectory(path)
        return
    endif

    if &filetype ==# 'defx'
        return
    endif

    if a:path ==# '' || bufnr('%') != expand('<abuf>')
        return
    endif

    Defx -show-ignored-files -new `expand('%:p:h')`
endfunction
