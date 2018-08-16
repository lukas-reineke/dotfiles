"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Close Buffer {{{

function! OpenBufferNumber()
    let l:count = 0
    for l:i in range(0, bufnr('$'))
        if buflisted(l:i)
            let l:count += 1
        endif
    endfor
    return l:count
endfunction

function! CloseOnLast()
    if OpenBufferNumber() <= 1
        q
    else
        bd
    endif
endfunction

" }}}
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Strip trailing whitespace {{{

let g:DisableStripTrailingWhitespaces = 0
function! s:StripTrailingWhitespaces()
    if !g:DisableStripTrailingWhitespaces
        let l:l = line('.')
        let l:c = col('.')
        %s/\s\+$//e
        call cursor(l:l, l:c)
    endif
endfunction

augroup stripWhitespaces
    autocmd!
    autocmd stripWhitespaces BufWritePre * :call s:StripTrailingWhitespaces()
augroup END

function! ToggleStripTrailingWhitespaces()
    if g:DisableStripTrailingWhitespaces
        let g:DisableStripTrailingWhitespaces = 0
    else
        let g:DisableStripTrailingWhitespaces = 1
    endif
endfunction

command ToggleStripTrailingWhitespaces :call ToggleStripTrailingWhitespaces()

" }}}
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Auto Root {{{

function! <SID>AutoProjectRootCD()
    try
        if &filetype !=# 'help'
            ProjectRootCD
        endif
    catch
        " Silently ignore invalid buffers
    endtry
endfunction

augroup autoRoot
    autocmd!
    autocmd BufEnter * call <SID>AutoProjectRootCD()
augroup END

" }}}
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Japanese {{{

let g:input_toggle = 0
function! FcitxToEn()
    let s:input_status = system('fcitx-remote')
    if s:input_status == 2
        let g:input_toggle = 1
        let l:a = system('fcitx-remote -c')
    endif
endfunction

function! FcitxToJp()
    let s:input_status = system('fcitx-remote')
    if s:input_status != 2 && g:input_toggle == 1
        let l:a = system('fcitx-remote -o')
        let g:input_toggle = 0
    endif
endfunction

augroup japaneseInput
    autocmd!
    autocmd InsertLeave * call FcitxToEn()
    autocmd InsertEnter * call FcitxToJp()
augroup END

function! ToggleInput()
    if g:input_toggle
        let g:input_toggle=0
    else
        let g:input_toggle=1
    endif
endfunction

command Japanese :call ToggleInput()

" }}}
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Match {{{

let g:over_length = 0

function! ToggleOverLength()
    if g:over_length
        let g:over_length=0
        match none
    else
        let g:over_length=1
        match Error /.\%>72v/
    endif
endfunction

command OverLength :call ToggleOverLength()

" }}}
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Json Format {{{

command JsonFormat :%!python -m json.tool

" }}}
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Restore Session {{{

function! RestoreSession()
    let l:ignore = [ 'gitcommit', 'man' ]
    if filereadable(getcwd() . '/Session.vim') && index(l:ignore, &filetype) < 0 && argc() == 0
        execute 'so ' . getcwd() . '/Session.vim'
        if bufexists(1)
            for l:l in range(1, bufnr('$'))
                if bufwinnr(l:l) ==# -1
                    exec 'sbuffer ' . l:l
                endif
            endfor
        endif
    endif
endfunction

augroup RestoreSession
    autocmd!
    autocmd VimEnter * nested call RestoreSession()
augroup END

" }}}
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Quick Fix {{{

function! QuickFix()
    let l:buftype_list = ['quickfix', 'help', 'nofile']
    let l:filetype_list = ['netrw']
    if (index(l:buftype_list, &buftype) >= 0 || index(l:filetype_list, &filetype) >= 0)
        let g:qs_enable = 0
        if &buftype == 'quickfix'
            execute 'highlight CursorLine guibg=' . onedark#GetColors().cursor_grey.gui
        endif
    else
        let g:qs_enable = 1
        execute 'highlight CursorLine guibg=' . onedark#GetColors().dark_black.gui
    endif
endfunction

augroup QuickFix
    autocmd!
    autocmd BufWinEnter,BufEnter,cursormoved * call QuickFix()
augroup END

" }}}
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Undoubled Completion{{{

augroup Undouble_Completions
    autocmd!
    autocmd CompleteDone * call Undouble_Completions()
augroup END

function! Undouble_Completions ()
    let l:col  = getpos('.')[2]
    let l:line = getline('.')
    call setline('.', substitute(l:line, '\(\.\?\k\+\)\%'.l:col.'c\zs\1', '', ''))
endfunction

" }}}
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Fold Text {{{

function! FoldText()
    let l:line = getline(v:foldstart)

    let l:nucolwidth = &foldcolumn + &number * &numberwidth
    let l:windowwidth = winwidth(0) - l:nucolwidth - 4
    let l:foldedlinecount = v:foldend - v:foldstart

    " expand tabs into spaces
    let l:onetab = strpart('          ', 0, &tabstop)
    let l:line = substitute(l:line, '\t', l:onetab, 'g')

    let l:line = strpart(l:line, 0, l:windowwidth - 2 -len(l:foldedlinecount))

    let [l:added, l:modified, l:removed] = sy#repo#get_stats()
    if l:added > 0 || l:modified > 0 || l:removed > 0 || len(getqflist()) > 0 || len(signature#mark#GetList('used', 'buf_all')) > 0
        let l:fillcharcount = l:windowwidth - len(l:line) - len(l:foldedlinecount) - 2
    else
        let l:fillcharcount = l:windowwidth - len(l:line) - len(l:foldedlinecount)
    endif

    return '>- ' . l:line . repeat(' ',l:fillcharcount) . l:foldedlinecount . ' >-'
endfunction
set foldtext=FoldText()

" }}}
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Diff Fold {{{

function! FoldCloseAll()
    if winnr('$') > 1 && &foldmethod ==# 'diff'
        let l:currentWindow=winnr()
        windo execute 'normal! zm'
        execute l:currentWindow . 'wincmd w'
    endif
endfunction

augroup CloseDiffFoldInAllWindows
    autocmd!
    autocmd cursormoved * call FoldCloseAll()
augroup END

" }}}
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Win Highlight {{{

function! WinHighlight()
    if &foldmethod ==# 'diff' || &buftype ==# 'nofile'
        set winhighlight=
    else
        set winhighlight=NormalNC:WinNormalNC
    endif
endfunction

augroup WinHighlight
    autocmd!
    autocmd WinEnter,VimEnter * :call WinHighlight()
augroup END

" }}}
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Man TOC {{{

command TOC :call man#show_toc()<CR>

" }}}
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim:foldmethod=marker:foldlevel=0

