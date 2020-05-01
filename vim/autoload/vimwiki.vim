
function! vimwiki#PrettierAll()
    let l:view=winsaveview()
    for syntax in ['javascript', 'typescript']
        call cursor(1, 1)
        while 1
            let l:start_line = search('^{{{' . syntax . '$', 'Wc')
            if l:start_line ==# 0
                break
            endif
            let l:end_line = search('^}}}$', 'W')
            execute 'silent ' . (l:start_line + 1) . ',' . (l:end_line - 1) . '!prettier ' . g:ale_javascript_prettier_options
        endwhile
    endfor
    call winrestview(l:view)
endfunction

function! vimwiki#PrettierCurrent()
    let l:parser_map = {'javascript': 'babel'}
    let l:view=winsaveview()
    for syntax in ['javascript', 'typescript']
        let l:start_line = search('^{{{' . syntax . '$', 'bnWc')
        let l:end_prev_line = search('^}}}$', 'nbW')
        let l:parser = get(l:parser_map, syntax, syntax)

        if l:start_line && l:start_line > l:end_prev_line
            let l:end_line = search('^}}}$', 'nW')
            execute 'silent ' . (l:start_line + 1) . ',' . (l:end_line - 1) . '!prettier ' . g:ale_javascript_prettier_options . ' --parser ' . l:parser
        endif
    endfor
    call winrestview(l:view)
endfunction
