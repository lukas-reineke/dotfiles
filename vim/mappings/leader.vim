"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Leader Mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let mapleader = "\<Space>"


" switch to last buffer
nnoremap <Leader><Leader> <C-^>

" FZF
nnoremap <Leader>p :Buffers<CR>
" nnoremap <Leader><C-P> :call fzf#run({'source': '~/dotfiles/scripts/bookmarks.sh', 'sink': ':Files', 'down': '18'})<CR>
nnoremap <Leader><C-P> :Commands<CR>
nnoremap <Leader><C-W> :Windows<CR>


nnoremap <Leader><C-H> :hide<CR>
nnoremap <Leader><C-J> :only<CR>
nnoremap <Leader><C-K> :sv#<CR>
nnoremap <Leader><C-L> :vs#<CR>
nnoremap <Leader><C-O> :Bufonly<CR>

" save/close
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :call CloseOnLast()<CR>
nnoremap <Leader>Q :q<CR>
nnoremap <Leader>x :x<CR>

" open from dir
nnoremap <Leader>n :Files %:h<CR>
nnoremap <Leader>N :E %:h/

" Search all
" nnoremap <Leader>a :RG<Space>
nnoremap <Leader>a :F<Space><Space>**/*.*<Left><Left><Left><Left><Left><Left><Left>
" nnoremap <Leader>r :%smagic/
" vnoremap <Leader>r :smagic/
nnoremap <Leader>r :OverCommandLine<CR>%s/
vnoremap <Leader>r :OverCommandLine<CR>s/

" Jump To Definition
nnoremap <Leader>d <C-]>
nnoremap <Leader>b <C-T>

autocmd FileType typescript nnoremap <silent> <Leader>ti :TsuImport<CR>
autocmd FileType typescript nmap <buffer> <Leader>t : <C-u>echo tsuquyomi#hint()<CR>

" new line without insert
nnoremap <Leader>o o<esc>k
nnoremap <Leader>O O<esc>j

" Easy motion
map <Leader>ee <Plug>(easymotion-bd-w)
nmap <Leader>ee <Plug>(easymotion-overwin-w)
nmap <Leader>ef <Plug>(easymotion-overwin-f2)
map <Leader>es <Plug>(incsearch-easymotion-/)\v
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>h <Plug>(easymotion-linebackward)

" Spell correct
nnoremap <Leader>z 1z=

" Undo Tree
nnoremap <Leader>u :MundoToggle<CR>

" Eslint
nnoremap <Leader>th :Autoformat<CR>

nnoremap <Leader>c :cclose<CR>

" Mark Down Preview
nnoremap <Leader>tt :LivedownToggle<CR>
nnoremap <Leader>tl :lNext<CR>

nmap <leader>gj <plug>(signify-next-hunk)
nmap <leader>gk <plug>(signify-prev-hunk)
nmap <leader>gJ 9999<leader>gj
nmap <leader>gK 9999<leader>gk

nnoremap <Leader>ii :call ToggleInput()<CR>

function! ToggleInput()
    if g:input_toggle
        let g:input_toggle=0
    else
        let g:input_toggle=1
    endif
endfunction

" Git
nnoremap <Leader>gg :Merginal<CR>
nnoremap <Leader>gd :Gvdiff<CR>
nnoremap <Leader>gr :Gread<CR>
nnoremap <Leader>gb :Gblame<CR>
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gm :Gsdiff :1 \| Gvdiff<CR>
nnoremap <Leader>gl :BCommits<CR>
nnoremap <Leader>gf :GFiles?<CR>
nnoremap <Leader>gt :SignifyToggleHighlight<CR>

nnoremap <Leader>; :CommaOrSemiColon<CR>

