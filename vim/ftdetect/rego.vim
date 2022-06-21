autocmd BufRead,BufNewFile *.rego set filetype=rego

" Use # as a comment prefix
autocmd FileType rego setlocal comments=b:#,fb:-
autocmd FileType rego setlocal commentstring=#\ %s
