"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Complete {{{

inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" inoremap <C-O> <C-X><C-O>
imap <C-X><C-F> <ESC>:cd %:p:h<CR>a<plug>(fzf-complete-file)
inoremap <C-B> <C-E>
inoremap <silent><expr> ( complete_parameter#pre_complete("()")
inoremap <C-L> <C-X><C-L>
inoremap <C-E> <ESC>BDi<><ESC>hpyypa/<ESC>O
inoremap <silent><expr> <C-n> coc#refresh()
inoremap <C-O> <C-X><C-N>

inoremap <expr> <C-X><C-L> fzf#vim#complete(fzf#wrap({
\   'prefix': '^.*$',
\   'source': 'rg -n ^ --color always',
\   'options': '--ansi --delimiter : --nth 3..',
\   'reducer': { lines -> join(split(lines[0], ':\zs')[2:], '') }
\}))

inoremap <C-F>
    \ <C-O>:let b:oldpwd = getcwd() <bar>
    \ lcd %:p:h<cr><C-X><C-F>
imap <expr> <C-G> pumvisible()
    \ ? len(v:completed_item) ? '<C-Y><C-F>' : '<C-N><C-Y><C-F>'
    \ : '<C-G>'

augroup pathRestore
    autocmd!
    autocmd CompleteDone *
        \ if exists('b:oldpwd') |
        \     cd `=b:oldpwd` |
        \     unlet b:oldpwd |
        \ endif
augroup END

" }}}
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Smart Backspace {{{

inoremap <silent><expr><S-BS>
            \ (&indentexpr isnot '' ? &indentkeys : &cinkeys) =~? '!\^F' &&
            \ &backspace =~? '.*eol\&.*start\&.*indent\&' &&
            \ !search('\S','nbW',line('.')) ? "\<C-U>\<bs>" .
            \ (getline(line('.')-1) =~ '\S' ? "" : "\<C-F>") : "\<C-R>=AutoPairsDelete()\<CR>"

" }}}
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Float scroll {{{

function! FloatScroll(forward) abort
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

inoremap <silent><expr> <down> coc#util#has_float() ? FloatScroll(1) : "\<down>"
inoremap <silent><expr>  <up>  coc#util#has_float() ? FloatScroll(0) :  "\<up>"

" }}}
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" vim:foldmethod=marker:foldlevel=0

