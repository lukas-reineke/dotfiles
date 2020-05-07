
function! session#Restore()
    let l:ignore = [ 'gitcommit', 'man' ]
    if len(nvim_list_uis()) && filereadable(getcwd() . '/Session.vim') && index(l:ignore, &filetype) < 0 && argc() == 0
        execute 'so ' . getcwd() . '/Session.vim'
        if bufexists(1)
            for l:l in range(1, bufnr('$'))
                if bufwinnr(l:l) ==# -1
                    exec 'sbuffer ' . l:l
                endif
            endfor
        endif
    endif
endfunction

