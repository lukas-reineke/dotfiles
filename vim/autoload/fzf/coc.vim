
function! fzf#coc#Actions()
    let l:options = [
        \ 'doHover',
        \ 'rename',
        \ 'codeAction',
        \ 'codeLensAction',
        \ 'highlight',
        \ 'jumpReferences',
        \ 'jumpImplementation',
        \ 'quickfixes',
    \ ]

    call fzf#run({
    \   'source': l:options,
    \   'sink': function('CocAction'),
    \   'window': 'call fzf#floating_window#Create()',
    \})
endfunction
