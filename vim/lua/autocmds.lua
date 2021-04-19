vim.cmd [[augroup Autogroup]]
vim.cmd [[autocmd VimEnter * nested lua require("session").restore()]]

vim.cmd [[autocmd CursorMoved * call PoppyInit()]]
vim.cmd [[autocmd CursorMoved * lua require('fold').close_all()]]

vim.cmd [[au TextYankPost * silent! lua vim.highlight.on_yank {higroup="HighlightedyankRegion", timeout=150}]]

vim.cmd [[autocmd VimEnter * highlight QuickScopePrimary gui=bold guifg=NONE]]
vim.cmd [[autocmd VimEnter * highlight QuickScopeSecondary gui=bold guifg=NONE]]

vim.cmd [[autocmd FileChangedShellPost,Syntax,TextChanged,InsertLeave,WinScrolled * lua require('markdown').headlines()]]

vim.cmd [[autocmd BufWritePost plugins.lua PackerCompile]]

vim.cmd [[autocmd User PackerComplete,PackerCompileDone lua require("indent_blankline.utils").reset_highlights()]]

vim.cmd [[autocmd BufEnter * lua require("defx").hijak()]]

vim.cmd [[augroup END]]
