
augroup Autogroup
    autocmd!
    autocmd WinEnter,VimEnter * highlight QuickScopePrimary gui=bold guifg=NONE
    autocmd WinEnter,VimEnter * highlight QuickScopeSecondary gui=bold guifg=NONE

    autocmd VimEnter * nested call session#Restore()

    autocmd CursorHold * silent call CocActionAsync('highlight')

    autocmd BufRead,BufNewFile .eslintrc,.stylelintrc,.htmlhintrc set filetype=json
    autocmd BufRead,BufNewFile *.tsx set filetype=typescript.tsx
    autocmd BufRead,BufNewFile *.jsx set filetype=javascript
    autocmd BufRead,BufNewFile * set formatoptions-=o

    autocmd Bufenter,FileChangedShellPost,InsertLeave *.md call markdown#Dashes()
    autocmd Bufenter,FileChangedShellPost,InsertLeave *.wiki call markdown#Dashes()
    autocmd User ALEFixPost call markdown#Dashes()
    autocmd Bufenter,FileChangedShellPost,InsertLeave *.md call markdown#Headlines()
    autocmd Bufenter,FileChangedShellPost,InsertLeave *.wiki call markdown#Headlines()
    autocmd User ALEFixPost call markdown#Headlines()

    autocmd BufWritePre *.wiki call vimwiki#PrettierCurrent()

    autocmd BufEnter * call auto_root#Cd()

    autocmd BufWritePost,FileChangedShellPost * SignifyRefresh
    autocmd User ALEFixPost SignifyRefresh
    autocmd User ALEFixPost IndentBlanklineRefresh

    autocmd cursormoved * call PoppyInit()
    autocmd cursormoved * call fold#CloseAll()

    autocmd CompleteDone * call complete#Undouble()
    autocmd CompleteDone *
        \ if exists('b:oldpwd') |
        \     cd `=b:oldpwd` |
        \     unlet b:oldpwd |
        \ endif

    " autocmd BufWritePost * call defx#redraw()
augroup END
