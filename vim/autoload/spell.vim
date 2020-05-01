
let g:spell_toggle = 0
function! spell#Toggle()
    if g:spell_toggle
        let g:spell_toggle=0
        set nospell
        call clearmatches()
        echom 'spell off'
    else
        let g:spell_toggle=1
        set spell
        Codespell
        echom 'spell on'
    endif
endfunction

