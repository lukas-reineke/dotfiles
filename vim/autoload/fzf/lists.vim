
function! fzf#lists#Change()
    let l:options = [
        \ 'Quickfix',
        \ 'Location',
        \ 'Ale',
    \ ]

    call fzf#run({
    \   'source': l:options,
    \   'sink': function('lists#ChangeActiveList'),
    \   'window': 'call fzf#floating_window#Create()',
    \})
endfunction
