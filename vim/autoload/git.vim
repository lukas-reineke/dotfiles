
function! git#SetHead(head)
    if len(a:head)
        let g:gitHead = a:head
    else
        let g:gitHead = 'HEAD'
    endif

    let g:gitgutter_diff_base = g:gitHead
    let l:win_id = win_getid()
    windo GitGutter
    call win_gotoid(l:win_id)
    " let g:signify_vcs_cmds['git'] = 'git diff --no-color --no-ext-diff -U0 ' . g:gitHead . ' -- %f'
    call defx#custom#column('git', 'git_commit', g:gitHead)
    let g:gitgutter_diff_base = g:gitHead

    echom 'Now diffing against ' . g:gitHead
endfunction
