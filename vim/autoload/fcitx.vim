
let g:input_toggle = 0
function! fcitx#SwitchToEn()
    let s:input_status = system('fcitx-remote')
    if s:input_status == 2
        let g:input_toggle = 1
        let l:a = system('fcitx-remote -c')
    endif
endfunction

function! fcitx#SwitchToJp()
    let s:input_status = system('fcitx-remote')
    if s:input_status != 2 && g:input_toggle == 1
        let l:a = system('fcitx-remote -o')
        let g:input_toggle = 0
    endif
endfunction

function! fcitx#ToggleInput()
    if g:input_toggle
        let g:input_toggle=0
    else
        let g:input_toggle=1
    endif
endfunction

augroup japaneseInput
    autocmd!
    autocmd InsertLeave * call fcitx#SwitchToEn()
    autocmd InsertEnter * call fcitx#SwitchToJp()
augroup END

