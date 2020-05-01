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

command Japanese :call fcitx#ToggleInput()

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
    if len(nvim_list_uis()) && filereadable(getcwd() . '/Session.vim') && index(l:ignore, &filetype) < 0 && argc() == 0
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

set foldtext=fold#FoldText()

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

command! Urls call fzf#urls#Open()
command! -nargs=* -bang RG call fzf#ripgrep#Search(<q-args>, <bang>0)
command! MarkdownHeadersFzf call fzf#headers#Show('markdown')
command! VimwikiHeadersFzf call fzf#headers#Show('vimwiki')

" }}}
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Codespell {{{

command! SpellClear call clearmatches()
command! Spell Codespell
command! SpellToggle :call spell#Toggle()

nnoremap <Leader>s :SpellToggle<CR>

" }}}
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Git head {{{

let g:gitHead = 'HEAD'
command! -nargs=* GitHead call git#SetHead(<q-args>)

" }}}
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:foo = {}
let g:defaultPrefix = 'default'

function! Foo(...)

    if a:0
        let g:defaultPrefix = a:1
    endif

    if !has_key(g:foo, g:defaultPrefix)
        let g:foo[g:defaultPrefix] = []
    endif

    call add(g:foo[g:defaultPrefix], expand('%'))

endfunction

" vim:foldmethod=marker:foldlevel=0
