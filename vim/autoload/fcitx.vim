
let g:input_toggle = 0
function! fcitx#SwitchToEn()
    if !g:input_toggle
        return
    endif
    let s:input_status = system('fcitx-remote')
    if s:input_status == 2
        call system('fcitx-remote -c')
    endif
endfunction

function! fcitx#SwitchToJp()
    if !g:input_toggle
        return
    endif
    let s:input_status = system('fcitx-remote')
    if s:input_status != 2
        call system('fcitx-remote -o')
    endif
endfunction

function! fcitx#ToggleInput()
    let g:input_toggle = !g:input_toggle
endfunction

augroup japaneseInput
    autocmd!
    autocmd InsertLeave * call fcitx#SwitchToEn()
    autocmd InsertEnter * call fcitx#SwitchToJp()
augroup END

