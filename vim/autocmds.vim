augroup Autogroup
    autocmd!
    autocmd WinEnter,VimEnter * highlight QuickScopePrimary gui=bold guifg=NONE
    autocmd WinEnter,VimEnter * highlight QuickScopeSecondary gui=bold guifg=NONE

    autocmd VimEnter * nested call session#Restore()
    autocmd VimEnter * TSContextDisable

    autocmd BufRead,BufNewFile .eslintrc,.stylelintrc,.htmlhintrc set filetype=json
    autocmd BufRead,BufNewFile * set formatoptions-=o

    autocmd cursormoved * call PoppyInit()
    autocmd cursormoved * call fold#CloseAll()

    autocmd CompleteDone * call complete#Undouble()
    autocmd CompleteDone * call complete#ReturnToOldPath()

    autocmd BufEnter * call hijak#OpenDefx(expand('<amatch>'))
augroup END
