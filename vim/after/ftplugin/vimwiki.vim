setlocal nowrap
setlocal spell
setlocal listchars=
setlocal colorcolumn=

function! VimwikiFoldLevelCustom(lnum)
    let pounds = strlen(matchstr(getline(a:lnum), '^=\+'))
    if (pounds)
        return '>' . pounds
    endif
    if getline(a:lnum) =~? '\v^\s*$'
        if (strlen(matchstr(getline(a:lnum + 1), '^=\+')))
            return '-1'
        endif
    endif
    return '='
endfunction

setlocal foldnestmax=20
setlocal foldexpr=VimwikiFoldLevelCustom(v:lnum)
setlocal foldmethod=expr

UltiSnipsAddFiletypes markdown.vimwiki.javascript

nmap <buffer> <TAB> <Plug>VimwikiNextLink
nmap <buffer> <S-TAB> <Plug>VimwikiPrevLink
nmap <buffer> = <Plug>VimwikiAddHeaderLevel
nmap <buffer> + <Plug>VimwikiRemoveHeaderLevel
nmap <buffer> _ <Plug>VimwikiNormalizeLink
nmap <buffer> <C-LEFT> <Plug>VimwikiTableMoveColumnLeft
nmap <buffer> <C-RIGHT> <Plug>VimwikiTableMoveColumnRight
" nmap <buffer> <C-]> <Plug>VimwikiFollowLink
nmap <buffer> <C-]> <C-]>
inoremap <buffer> <C-O> <C-X><C-O>


nnoremap <buffer> <leader>f :VimwikiHeadersFzf<CR>
nmap <buffer> <Leader>w <Plug>VimwikiRenumberAllLists:w<CR>

let g:AutoPairs = {
\   '[':']',
\   '{':'}',
\   "'":"'",
\   '"':'"',
\   '`':'`',
\   '<': '>',
\   '_': '_',
\}
let g:AutoPairsDelete = {
\   '(':')',
\   '[':']',
\   '{':'}',
\   "'":"'",
\   '"':'"',
\   '`':'`',
\   '<': '>',
\   '_': '_',
\}


" sign define codeblock text=│ texthl=markdownCodeBlockBGBorderSign linehl=markdownCodeBlockBG
" sign define codeblockborderStart text=╭ texthl=markdownCodeBlockBGBorderSign linehl=markdownCodeBlockBGBorder
" sign define codeblockborderEnd text=╰ texthl=markdownCodeBlockBGBorderSign linehl=markdownCodeBlockBGBorder

" sign define headline text== texthl=markdownHeadingDelimiter linehl=markdownHeadline

sign define codeblock linehl=markdownCodeBlockBG
sign define codeblockborderStart linehl=markdownCodeBlockBGBorder
sign define codeblockborderEnd linehl=markdownCodeBlockBGBorder

sign define headline linehl=markdownHeadline
sign define firstHeadline linehl=markdownFirstHeadline
sign define secondHeadline linehl=markdownSecondHeadline

function! VimwikiBlocks()
    let l:continue = 0
    execute 'sign unplace * file='.expand('%')
    for l:lnum in range(1, len(getline(1, '$')))
        let l:line = getline(l:lnum)

        if l:line =~# '^='
            execute 'sign place '.l:lnum.' line='.l:lnum.' name=headline file='.expand('%')
        endif

        if l:line =~# '^===\s'
            execute 'sign place '.l:lnum.' line='.l:lnum.' name=headline file='.expand('%')
        endif

        if l:line =~# '^==\s'
            execute 'sign place '.l:lnum.' line='.l:lnum.' name=secondHeadline file='.expand('%')
        endif

        if l:line =~# '^=\s'
            execute 'sign place '.l:lnum.' line='.l:lnum.' name=firstHeadline file='.expand('%')
        endif
        " if l:continue
        "     if l:line =~# '^}}}$'
        "         execute 'sign place '.l:lnum.' line='.l:lnum.' name=codeblockborderEnd file='.expand('%')
        "         let l:continue = 0
        "     else
        "         execute 'sign place '.l:lnum.' line='.l:lnum.' name=codeblock file='.expand('%')
        "     endif
        " elseif l:line =~# '^{{{.*$'
        "     let l:continue = 1
        "     execute 'sign place '.l:lnum.' line='.l:lnum.' name=codeblockborderStart file='.expand('%')
        " endif
    endfor
endfunction

augroup Vimwiki
    autocmd!
    autocmd Bufenter *.wiki call markdown#Dashes()
    autocmd FileChangedShellPost *.wiki call markdown#Dashes()
    autocmd User ALEFixPost call markdown#Dashes()
    autocmd InsertLeave *.wiki call markdown#Dashes()

    autocmd InsertLeave *.wiki call VimwikiBlocks()
    autocmd Bufenter *.wiki call VimwikiBlocks()
    autocmd BufWritePost *.wiki call VimwikiBlocks()
    autocmd FileChangedShellPost *.wiki call VimwikiBlocks()
    autocmd User ALEFixPost call VimwikiBlocks()

    autocmd BufWritePre *.wiki call vimwiki#PrettierCurrent()
augroup END

