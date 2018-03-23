"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Close Buffer {{{

function! OpenBufferNumber()
    let count = 0
    for i in range(0, bufnr("$"))
        if buflisted(i)
            let count += 1
        endif
    endfor
    return count
endfunction

function! CloseOnLast()
    if OpenBufferNumber() <= 1
        q
    else
        call undoquit#SaveWindowQuitHistory()
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
        let l:l = line(".")
        let l:c = col(".")
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
        if &ft != 'help'
            ProjectRootCD
        endif
    catch
        " Silently ignore invalid buffers
    endtry
endfunction

autocmd BufEnter * call <SID>AutoProjectRootCD()

" }}}
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Japanese {{{

let g:input_toggle = 0
function! FcitxToEn()
    let s:input_status = system("fcitx-remote")
    if s:input_status == 2
        let g:input_toggle = 1
        let l:a = system("fcitx-remote -c")
    endif
endfunction

function! FcitxToJp()
    let s:input_status = system("fcitx-remote")
    if s:input_status != 2 && g:input_toggle == 1
        let l:a = system("fcitx-remote -o")
        let g:input_toggle = 0
    endif
endfunction

autocmd InsertLeave * call FcitxToEn()
autocmd InsertEnter * call FcitxToJp()

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
" Clear Registers {{{

" https://stackoverflow.com/a/26043227
function! ClearRegisters()
    redir => l:register_out
    silent register
    redir end
    let l:register_list = split(l:register_out, '\n')
    call remove(l:register_list, 0) " remove header (-- Registers --)
    call map(l:register_list, "substitute(v:val, '^.\\(.\\).*', '\\1', '')")
    call filter(l:register_list, 'v:val !~ "[%#=.:]"') " skip readonly registers
    for elem in l:register_list
        execute 'let @'.elem.'= ""'
    endfor
endfunction

" }}}
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Make Dir {{{

" https://github.com/junegunn/fzf.vim/issues/89#issuecomment-187764499
function s:MKDir(...)
    if         !a:0
           \|| stridx('`+', a:1[0])!=-1
           \|| a:1=~#'\v\\@<![ *?[%#]'
           \|| isdirectory(a:1)
           \|| filereadable(a:1)
           \|| isdirectory(fnamemodify(a:1, ':p:h'))
        return
    endif
    return mkdir(fnamemodify(a:1, ':p:h'), 'p')
endfunction
command -bang -bar -nargs=? -complete=file E :call s:MKDir(<f-args>) | e<bang> <args>

" }}}
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Restore Session {{{

function! RestoreSession()
    let ignore = ['.env.sh', '.secrets', '.projections.json']
    if filereadable(getcwd() . '/Session.vim') && &filetype != "gitcommit" && index(ignore, expand('%:t')) < 0
        execute 'so ' . getcwd() . '/Session.vim'
        if bufexists(1)
            for l in range(1, bufnr('$'))
                if bufwinnr(l) == -1
                    exec 'sbuffer ' . l
                endif
            endfor
        endif
    endif
endfunction

autocmd VimEnter * nested call RestoreSession()

" }}}
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Quick Fix{{{

function! QuickFix()
    let buftype_list = ['quickfix', 'help', 'nofile']
    let filetype_list = ['netrw']
    if (index(buftype_list, &buftype) >= 0 || index(filetype_list, &filetype) >= 0)
        let g:qs_enable = 0
        " match Error /.*/
        " syntax match Error /|.*|/
        " syntax match Error /\d*\scol\s\d*/
        if &buftype == 'quickfix'
            match Error /|/
            syntax match qfFileName /^[^|]*/ transparent conceal
            syntax match qfError /error\(|\s\|\s\d*|\s\)/ transparent conceal
            syntax match qfCol /\d*\scol\s\d*/ transparent conceal
        endif
    else
        let g:qs_enable = 1
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
    let col  = getpos('.')[2]
    let line = getline('.')
    call setline('.', substitute(line, '\(\.\?\k\+\)\%'.col.'c\zs\1', '', ''))
endfunction

" }}}
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Fold Text {{{

function! FoldText()
    let line = getline(v:foldstart)

    let nucolwidth = &fdc + &number * &numberwidth
    let windowwidth = winwidth(0) - nucolwidth - 3
    let foldedlinecount = v:foldend - v:foldstart

    " expand tabs into spaces
    let onetab = strpart('          ', 0, &tabstop)
    let line = substitute(line, '\t', onetab, 'g')

    let line = strpart(line, 0, windowwidth - 2 -len(foldedlinecount))

    let [added, modified, removed] = sy#repo#get_stats()
    if added > 0 || modified > 0 || removed > 0 || len(getqflist()) > 0 || len(signature#mark#GetList('used', 'buf_all')) > 0
        let fillcharcount = windowwidth - len(line) - len(foldedlinecount) - 2
    else
        let fillcharcount = windowwidth - len(line) - len(foldedlinecount)
    endif

    return '➔ ' . line . repeat(" ",fillcharcount) . foldedlinecount . ' '
endfunction
set foldtext=FoldText()

" }}}
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Diff Fold {{{

function! FoldCloseAll()
    if winnr('$') > 1 && &foldmethod == 'diff'
        let l:currentWindow=winnr()
        windo execute "normal! zm"
        execute l:currentWindow . "wincmd w"
    endif
endfunction

augroup CloseDiffFoldInAllWindows
    autocmd!
    autocmd cursormoved * call FoldCloseAll()
augroup END

" }}}
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Win Highlight{{{

function! WinHighlight()
    if &foldmethod == 'diff'
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
" Set Filetype{{{

function! s:SetFiletype(filetype)
    execute 'set filetype=' . a:filetype
endfunction

command FT :call fzf#run({
            \ 'source': map(split(globpath(&rtp, 'syntax/*.vim')),
            \ 'fnamemodify(v:val, ":t:r")'),
            \ 'sink': function('<sid>SetFiletype'),
            \ 'down': '40%'
            \ })

" }}}
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" vim:foldmethod=marker:foldlevel=0

