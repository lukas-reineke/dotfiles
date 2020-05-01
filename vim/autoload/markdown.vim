
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
