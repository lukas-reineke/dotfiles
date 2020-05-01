
function! fzf#floating_window#Create()
    let width = min([&columns - 4, max([80, &columns - 20])])
    let height = min([&lines - 4, max([20, &lines - 50])])
    let top = (&lines / 6) - 1
    let left = (&columns - width) / 2
    let opts = {
    \   'relative': 'editor',
    \   'row': top,
    \   'col': left,
    \   'width': width,
    \   'height': height,
    \   'style': 'minimal',
    \}

    let top = '╭' . repeat('─', width - 2) . '╮'
    let mid = '│' . repeat(' ', width - 2) . '│'
    let bot = '╰' . repeat('─', width - 2) . '╯'
    let lines = [top] + repeat([mid], height - 2) + [bot]
    let s:buf = nvim_create_buf(v:false, v:true)
    call nvim_buf_set_lines(s:buf, 0, -1, v:true, lines)
    call nvim_open_win(s:buf, v:true, opts)
    set winhl=Normal:Floating
    let opts.row += 1
    let opts.height -= 2
    let opts.col += 2
    let opts.width -= 4
    call nvim_open_win(nvim_create_buf(v:false, v:true), v:true, opts)
    augroup fzf
        autocmd!
        autocmd BufWipeout <buffer> exe 'bw '.s:buf
    augroup END
endfunction
