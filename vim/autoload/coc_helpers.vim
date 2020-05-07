
function! coc_helpers#FloatScroll(forward) abort
    let float = coc#util#get_float()
    if !float | return '' | endif
    let buf = nvim_win_get_buf(float)
    let buf_height = nvim_buf_line_count(buf)
    let win_height = nvim_win_get_height(float)
    if buf_height < win_height | return '' | endif
    let pos = nvim_win_get_cursor(float)

    if a:forward
        if pos[0] == 1
            let pos[0] += 3 * win_height / 4
        elseif pos[0] + win_height / 2 + 1 < buf_height
            let pos[0] += win_height / 2 + 1
        else
            let pos[0] = buf_height
        endif
    else
        if pos[0] == buf_height
            let pos[0] -= 3 * win_height / 4
        elseif pos[0] - win_height / 2 + 1  > 1
            let pos[0] -= win_height / 2 + 1
        else
            let pos[0] = 1
        endif
    endif

    call nvim_win_set_cursor(float, pos)

    return ''
endfunction

