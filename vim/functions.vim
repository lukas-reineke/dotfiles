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
command! -bang -nargs=* RG call fzf#vim#grep('rg -S --line-number --hidden -g "!.git" '.shellescape(<q-args>), 0, <bang>0 ? fzf#vim#with_preview('up:60%'): fzf#vim#with_preview('right:50%:hidden', '?'), <bang>0)

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

" ================ Japanese in insert ========================
let g:input_toggle = 0
function! FcitxToEn()
    let s:input_status = system("fcitx-remote")
    if s:input_status == 2
        let g:input_toggle = 1
        let l:a = system("fcitx-remote -c")
    endif
endfunction

function! FcitxToJp()
    let s:input_status = system("fcitx-remote")
    if s:input_status != 2 && g:input_toggle == 1
        let l:a = system("fcitx-remote -o")
        let g:input_toggle = 0
    endif
endfunction

autocmd InsertLeave * call FcitxToEn()
autocmd InsertEnter * call FcitxToJp()

" ================ line text object ========================
call textobj#user#plugin('line', {
\   '-': {
\     'select-a-function': 'CurrentLineA',
\     'select-a': 'al',
\     'select-i-function': 'CurrentLineI',
\     'select-i': 'il',
\   },
\ })

function! CurrentLineA()
  normal! 0
  let head_pos = getpos('.')
  normal! $
  let tail_pos = getpos('.')
  return ['v', head_pos, tail_pos]
endfunction

function! CurrentLineI()
  normal! ^
  let head_pos = getpos('.')
  normal! g_
  let tail_pos = getpos('.')
  let non_blank_char_exists_p = getline('.')[head_pos[2] - 1] !~# '\s'
  return
  \ non_blank_char_exists_p
  \ ? ['v', head_pos, tail_pos]
  \ : 0
endfunction

" ================ wrap :cnext/:cprevious and :lnext/:lprevious ========================
function! WrapCommand(direction, prefix)
    if a:direction == "up"
        try
            execute a:prefix . "previous"
        catch /^Vim\%((\a\+)\)\=:E553/
            execute a:prefix . "last"
        catch /^Vim\%((\a\+)\)\=:E\%(776\|42\):/
        endtry
    elseif a:direction == "down"
        try
            execute a:prefix . "next"
        catch /^Vim\%((\a\+)\)\=:E553/
            execute a:prefix . "first"
        catch /^Vim\%((\a\+)\)\=:E\%(776\|42\):/
        endtry
    endif
endfunction

nnoremap <silent> ]l :call WrapCommand('up', 'c')<CR>
nnoremap <silent> [l  :call WrapCommand('down', 'c')<CR>

nnoremap <silent> ]c :call WrapCommand('up', 'l')<CR>
nnoremap <silent> [c  :call WrapCommand('down', 'l')<CR>

" ================ clear registers ========================
" https://stackoverflow.com/a/26043227
function! ClearRegisters()
    redir => l:register_out
    silent register
    redir end
    let l:register_list = split(l:register_out, '\n')
    call remove(l:register_list, 0) " remove header (-- Registers --)
    call map(l:register_list, "substitute(v:val, '^.\\(.\\).*', '\\1', '')")
    call filter(l:register_list, 'v:val !~ "[%#=.:]"') " skip readonly registers
    for elem in l:register_list
        execute 'let @'.elem.'= ""'
    endfor
endfunction

" ================ create file and dir ========================
" https://github.com/junegunn/fzf.vim/issues/89#issuecomment-187764499
function s:MKDir(...)
    if         !a:0
           \|| stridx('`+', a:1[0])!=-1
           \|| a:1=~#'\v\\@<![ *?[%#]'
           \|| isdirectory(a:1)
           \|| filereadable(a:1)
           \|| isdirectory(fnamemodify(a:1, ':p:h'))
        return
    endif
    return mkdir(fnamemodify(a:1, ':p:h'), 'p')
endfunction
command -bang -bar -nargs=? -complete=file E :call s:MKDir(<f-args>) | e<bang> <args>

