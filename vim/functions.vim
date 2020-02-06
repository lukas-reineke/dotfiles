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
" Help {{{

command H :Helptags

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
" Magit {{{

" augroup VimagitBufferInit
"     autocmd!
"     autocmd User VimagitBufferInit only
" augroup END

" }}}
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Quick Fix {{{

" function! QuickFix()
"     let l:buftype_list = ['quickfix', 'help', 'nofile']
"     let l:filetype_list = ['netrw']
"     if (index(l:buftype_list, &buftype) >= 0 || index(l:filetype_list, &filetype) >= 0)
"         let g:qs_enable = 0
"         if &buftype == 'quickfix'
"             execute 'highlight CursorLine guibg=' . onedark#GetColors().cursor_grey.gui
"         endif
"     else
"         let g:qs_enable = 1
"         execute 'highlight CursorLine guibg=' . onedark#GetColors().dark_black.gui
"     endif
" endfunction

" augroup QuickFix
"     autocmd!
"     autocmd BufWinEnter,BufEnter,cursormoved * call QuickFix()
" augroup END

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

" https://github.com/wincent/wincent/blob/4578e56cc23/roles/dotfiles/files/.vim/autoload/autocmds.vim#L39-L76
" function! Blur_window() abort
"     let l:buftype_list = ['quickfix', 'help', 'nofile', 'nowrite']
"     if &foldmethod ==# 'diff' || (index(l:buftype_list, &buftype) >= 0)
"         set winhighlight=
"     else
"         set winhighlight=NormalNC:WinNormalNC
"         if !exists('w:matches')
"             let w:matches=[]
"         endif
"         let l:height=&lines
"         let l:slop=l:height / 2
"         let l:start=max([1, line('w0') - l:slop])
"         let l:end=min([line('$'), line('w$') + l:slop])
"         while l:start <= l:end
"             let l:next=l:start + 8
"             let l:id=matchaddpos(
"                         \   'StatusLineNC',
"                         \   range(l:start, min([l:end, l:next])),
"                         \   1000
"                         \ )
"             call add(w:matches, l:id)
"             let l:start=l:next
"         endwhile
"     endif
" endfunction

" function! Focus_window() abort
"     if exists('w:matches')
"         for l:match in w:matches
"             call matchdelete(l:match)
"         endfor
"         let w:matches=[]
"     endif
" endfunction

" augroup WinHighlight
"     autocmd!
"     autocmd BufEnter,FocusGained,VimEnter,WinEnter * call Focus_window()
"     autocmd FocusLost,WinLeave * call Blur_window()
" augroup END

" }}}
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Man TOC {{{

command TOC :call man#show_toc()<CR>

" }}}
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Fzf {{{

function! Urls()
    let l:urls = split(system('xurls '.expand('%')), '\n')

    call fzf#run({
    \   'source': l:urls,
    \   'sink': '!open',
    \   'down': len(l:urls) + 2
    \})
endfunction

command! Urls call Urls()

function! RipgrepFzf(query, fullscreen)
    let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case %s || true'
    let initial_command = printf(command_fmt, shellescape(a:query))
    let reload_command = printf(command_fmt, '{q}')
    let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
    call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)

" }}}
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Codespell {{{

command! SpellClear call clearmatches()
command! Spell Codespell

let g:spell_toggle = 0
function! ToggleSpell()
    if g:spell_toggle
        let g:spell_toggle=0
        set nospell
        call clearmatches()
    else
        let g:spell_toggle=1
        set spell
        Codespell
    endif
endfunction

nnoremap <Leader>s :call ToggleSpell()<CR>

" }}}
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Signify {{{

command! -nargs=* SignifySet call SignifySet(<q-args>)

function SignifySet(head)
    let g:signify_vcs_cmds['git'] = 'git diff --no-color --no-ext-diff -U0 ' .. a:head .. ' -- %f'
    echom 'Now diffing against ' .. a:head
endfunction

" }}}
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Git head {{{

command! -nargs=* GitHead call SetGitHead(<q-args>)

let g:gitHead = 'HEAD'
function SetGitHead(head)
    if len(a:head)
        let g:gitHead = a:head
    else
        let g:gitHead = 'HEAD'
    endif

    call SignifySet(g:gitHead)
endfunction

" }}}
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim:foldmethod=marker:foldlevel=0
