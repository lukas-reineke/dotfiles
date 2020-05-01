
function! movement#SkipFold(direction) abort
    let l:pos = getpos('.')
    let l:posOrig = getpos('.')
    if a:direction
        let l:pos[1] = l:pos[1] + 5
        if l:pos[1] >= line('w$')
            let l:pos[1] = line('w$')
        endif
        call cursor(l:pos[1:])
    else
        let l:pos[1] = l:pos[1] - 5
        if l:pos[1] < 1
            let l:pos[1] = 1
        endif
        call cursor(l:pos[1:])
    endif

    let l:currentLine = line('.')

    while foldclosed(l:currentLine) != -1

        if a:direction
            let l:pos[1] = l:pos[1] + 1
            call cursor(l:pos[1:])
        else
            let l:pos[1] = l:pos[1] - 1
            call cursor(l:pos[1:])
        endif

        if l:pos[1] == line('w$')
            let l:posOrig[1] = l:posOrig[1] + 5
            call cursor(l:posOrig[1:])
            break
        elseif l:pos[1] == 0
            let l:posOrig[1] = l:posOrig[1] - 5
            call cursor(l:posOrig[1:])
            break
        endif

        let l:currentLine = line('.')
    endwhile
endfunction
