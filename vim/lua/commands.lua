vim.cmd [[command! -nargs=* -complete=customlist,fugitive#CompleteObject GitHead lua require('git').set_head('<q-args>')]]
