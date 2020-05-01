
function! search#DuckDuckGo(pattern)
    let l:q = '"'.substitute(a:pattern, '["\n]', ' ', 'g').'"'
    let l:q = substitute(
                \ l:q,
                \ '[[:punct:] ]',
                \ '\=printf("%%%02X", char2nr(submatch(0)))', 'g'
                \ )
    call system(printf('open "https://duckduckgo.com/?q=%s"', l:q))
endfunction
