setlocal nowrap
setlocal spell

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

augroup Vimwiki
    autocmd!
    autocmd BufWritePre *.wiki call VimwikiPrettierCurrent()
augroup END

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


sign define codeblock linehl=markdownCodeBlockBG
sign define codeblockborder linehl=markdownCodeBlockBGBorder
function! VimwikiBlocks()
    let l:continue = 0
    execute 'sign unplace * file='.expand('%')
    for l:lnum in range(1, len(getline(1, '$')))
        if l:continue
            if getline(l:lnum) =~# '^}}}$'
                execute 'sign place '.l:lnum.' line='.l:lnum.' name=codeblockborder file='.expand('%')
                let l:continue = 0
            else
                execute 'sign place '.l:lnum.' line='.l:lnum.' name=codeblock file='.expand('%')
            endif
        elseif getline(l:lnum) =~# '^{{{.*$'
            let l:continue = 1
            execute 'sign place '.l:lnum.' line='.l:lnum.' name=codeblockborder file='.expand('%')
        endif
    endfor
endfunction
