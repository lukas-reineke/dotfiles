
function! fzf#urls#Open()
    let l:urls = systemlist('xurls '.expand('%'))

    call fzf#run({
    \   'source': l:urls,
    \   'sink': 'silent !open',
    \   'window': 'call fzf#floating_window#Create()',
    \})
endfunction
