setlocal nowrap
setlocal spell
setlocal listchars=
setlocal colorcolumn=

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
sign define codeblockborderStart linehl=markdownCodeBlockBGBorder
sign define codeblockborderEnd linehl=markdownCodeBlockBGBorder

sign define headline linehl=markdownHeadline
sign define firstHeadline linehl=markdownFirstHeadline
sign define secondHeadline linehl=markdownSecondHeadline

function! MarkdownBlocks()
    let l:continue = 0
    execute 'sign unplace * file='.expand('%')
    for l:lnum in range(1, len(getline(1, '$')))
        let l:line = getline(l:lnum)

        if l:line =~# '^###\s'
            execute 'sign place '.l:lnum.' line='.l:lnum.' name=headline file='.expand('%')
        endif

        if l:line =~# '^##\s'
            execute 'sign place '.l:lnum.' line='.l:lnum.' name=secondHeadline file='.expand('%')
        endif

        if l:line =~# '^#\s'
            execute 'sign place '.l:lnum.' line='.l:lnum.' name=firstHeadline file='.expand('%')
        endif

        " if l:continue
        "     if l:line =~# '^```$'
        "         execute 'sign place '.l:lnum.' line='.l:lnum.' name=codeblock file='.expand('%')
        "         " execute 'sign place '.l:lnum.' line='.l:lnum.' name=codeblockborderEnd file='.expand('%')
        "         let l:continue = 0
        "     else
        "         execute 'sign place '.l:lnum.' line='.l:lnum.' name=codeblock file='.expand('%')
        "     endif
        " elseif l:line =~# '^```.*$'
        "     let l:continue = 1
        "     execute 'sign place '.l:lnum.' line='.l:lnum.' name=codeblock file='.expand('%')
        "     " execute 'sign place '.l:lnum.' line='.l:lnum.' name=codeblockborderStart file='.expand('%')
        " endif
    endfor
endfunction

augroup Markdown
    autocmd!
    autocmd Bufenter *.md call markdown#Dashes()
    autocmd FileChangedShellPost *.md call markdown#Dashes()
    autocmd User ALEFixPost call markdown#Dashes()
    autocmd InsertLeave *.md call markdown#Dashes()
    autocmd InsertLeave *.md call MarkdownBlocks()
    autocmd Bufenter *.md call MarkdownBlocks()
    autocmd BufWritePost *.md call MarkdownBlocks()
    autocmd FileChangedShellPost *.md call MarkdownBlocks()
    autocmd User ALEFixPost call MarkdownBlocks()
augroup END

