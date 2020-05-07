
let g:markdown_dash_namespace = nvim_create_namespace('markdown_dash')

function! markdown#Dashes()
    if &filetype !=# 'markdown' && &filetype !=# 'vimwiki'
        return
    endif

    let l:current_view = winsaveview()
    try
        call nvim_buf_clear_namespace(0, g:markdown_dash_namespace, 1, -1)
        call cursor(1, 1)

        let l:matches = []

        while 1
            let l:lnum = search('^---\+$', 'W')

            if l:lnum ==# 0
                break
            endif

            call nvim_buf_set_virtual_text(0, g:markdown_dash_namespace, l:lnum -1, [[repeat('─', 500), 'markdownBold']], {})
        endwhile
    catch
    finally
        call winrestview(l:current_view)
    endtry
endfunction

sign define firstHeadline linehl=markdownFirstHeadline
sign define secondHeadline linehl=markdownSecondHeadline
sign define thirdHeadline linehl=markdownHeadline

function! markdown#Headlines()
    if &filetype !=# 'markdown' && &filetype !=# 'vimwiki'
        return
    endif

    let l:marker = &filetype ==# 'markdown' ? '#' : '='

    let l:continue = 0
    execute 'sign unplace * file='.expand('%')

    for l:lnum in range(1, len(getline(1, '$')))
        let l:line = getline(l:lnum)

        if l:line =~# '^' . join(repeat([l:marker], 3), '') . '\s'
            execute 'sign place '.l:lnum.' line='.l:lnum.' name=thirdHeadline file='.expand('%')
        endif

        if l:line =~# '^' . join(repeat([l:marker], 2), '') . '\s'
            execute 'sign place '.l:lnum.' line='.l:lnum.' name=secondHeadline file='.expand('%')
        endif

        if l:line =~# '^' . join(repeat([l:marker], 1), '') . '\s'
            execute 'sign place '.l:lnum.' line='.l:lnum.' name=firstHeadline file='.expand('%')
        endif
    endfor
endfunction

function! markdown#FoldExpression(lnum)

    let l:marker = &filetype ==# 'markdown' ? '#' : '='
    let l:markers = strlen(matchstr(getline(a:lnum), '^' . l:marker . '\+'))

    if (l:markers)
        return '>' . l:markers
    endif

    if getline(a:lnum) =~? '\v^\s*$'
        if (strlen(matchstr(getline(a:lnum + 1), '^' . l:marker . '\+')))
            return '-1'
        endif
    endif
    return '='
endfunction

