setlocal nowrap
setlocal spell

function! MarkdownFoldLevel(lnum)
    let pounds = strlen(matchstr(getline(a:lnum), '^#\+'))
    if (pounds)
        return '>' . pounds
    endif
    if getline(a:lnum) =~? '\v^\s*$'
        if (strlen(matchstr(getline(a:lnum + 1), '^#\+')))
            return '-1'
        endif
    endif
    return '='
endfunction

setlocal foldexpr=MarkdownFoldLevel(v:lnum)
setlocal foldmethod=expr

UltiSnipsAddFiletypes markdown.javascript

nnoremap <buffer> <leader>f :MarkdownHeadersFzf<CR>

sign define codeblock linehl=markdownCodeBlockBG
sign define codeblockborder linehl=markdownCodeBlockBGBorder
function! MarkdownBlocks()
    let l:continue = 0
    execute 'sign unplace * file='.expand('%')
    for l:lnum in range(1, len(getline(1, '$')))
        if l:continue
            if getline(l:lnum) =~# '^```$'
                execute 'sign place '.l:lnum.' line='.l:lnum.' name=codeblockborder file='.expand('%')
                let l:continue = 0
            else
                execute 'sign place '.l:lnum.' line='.l:lnum.' name=codeblock file='.expand('%')
            endif
        elseif getline(l:lnum) =~# '^```.*$'
            let l:continue = 1
            execute 'sign place '.l:lnum.' line='.l:lnum.' name=codeblockborder file='.expand('%')
        endif
    endfor
endfunction
