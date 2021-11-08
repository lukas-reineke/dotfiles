vim.cmd [[command! -nargs=* -complete=customlist,fugitive#CompleteObject GitBase lua require('git').set_base(<q-args>)]]
