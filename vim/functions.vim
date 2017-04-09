"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" ================ close buffer or window ========================
function! CloseOnLast()
    let cnt = 0
    for i in range(0, bufnr("$"))
        if buflisted(i)
            let cnt += 1
        endif
    endfor
    if cnt <= 1
        q
    else
        bd
    endif
endfunction

" ================ Strip trailing whitespace ========================
function! s:StripTrailingWhitespaces()
    let l:l = line(".")
    let l:c = col(".")
    %s/\s\+$//e
    call cursor(l:l, l:c)
endfunction

augroup vimrc
    autocmd!
augroup END

autocmd vimrc BufWritePre * :call s:StripTrailingWhitespaces()

" ================ jump to the last position when reopening a file ========================
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif

au CursorHold * checktime

" ================ Keep undo history across sessions, by storing in file ========================
silent !mkdir ~/.config/nvim/backups > /dev/null 2>&1
set undodir=~/.config/nvim/backups
set undofile
