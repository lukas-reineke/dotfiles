"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" ================ Open Buffer Number ========================
function! OpenBufferNumber()
    let cnt = 0
    for i in range(0, bufnr("$"))
        if buflisted(i)
            let cnt += 1
        endif
    endfor
    return cnt
endfunction

" ================ close buffer or window ========================
function! CloseOnLast()
    if OpenBufferNumber() <= 1
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
    au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") && &filetype != "gitcommit" | exe "normal! g'\"" | endif
endif

au CursorHold * checktime

" ================ Keep undo history across sessions, by storing in file ========================
silent !mkdir ~/.config/nvim/backups > /dev/null 2>&1
set undodir=~/.config/nvim/backups
set undofile

" ================ Nerd Tree ========================
" Check if NERDTree is open or active
function! IsNERDTreeOpen()
    return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction

function! ToggleNERDTreeFind()
    if IsNERDTreeOpen()
        NERDTreeClose
    else
        NERDTreeFind
    endif
endfunction

" ================ Find Lines ========================
command! -bang -nargs=* RG call fzf#vim#grep('rg -S --line-number --hidden '.shellescape(<q-args>), 0, <bang>0 ? fzf#vim#with_preview('up:60%'): fzf#vim#with_preview('right:50%:hidden', '?'), <bang>0)

" ================ Auto Root ========================
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

