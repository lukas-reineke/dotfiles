
function! fzf#headers#Show(syntax)
    let l:lines = getbufline('%', 0, '$')
    let l:lines = map(l:lines, {index, value -> '[0;31m'. index . '[0;33m' . '	' . value})

    if a:syntax ==# 'markdown'
        call filter(l:lines, {_, value -> value =~# '^[0;31m\d\+[0;33m	#\+ .*$'})
    else
        call filter(l:lines, {_, value -> value =~# '^[0;31m\d\+[0;33m	=\+ .*$'})
        let l:lines = map(l:lines, {_, line -> substitute(line, '|[^=]* =', '=', '')})
        let l:lines = map(l:lines, {_, line -> substitute(line, '@[^=]* =', '=', '')})
        let l:lines = map(l:lines, {_, line -> substitute(line, ' @[A-Za-z0-9]\+', '', '')})
    endif

    function! s:go_to_line(line)
        execute 'normal ' . (split(a:line, '	')[0] + 1) . 'G'
    endfunc

    call fzf#run({
    \   'source': l:lines,
    \   'sink': function('s:go_to_line'),
    \   'window': 'call fzf#floating_window#Create()',
    \})
endfunction
