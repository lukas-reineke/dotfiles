
function! git#SetHead(head)
    if len(a:head)
        let g:gitHead = a:head
    else
        let g:gitHead = 'HEAD'
    endif

    let g:signify_vcs_cmds['git'] = 'git diff --no-color --no-ext-diff -U0 ' . g:gitHead . ' -- %f'
    echom 'Now diffing against ' . g:gitHead
endfunction
