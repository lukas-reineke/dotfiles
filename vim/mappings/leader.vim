"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Global {{{

let g:mapleader = "\<Space>"

nnoremap <Leader><Leader> <C-^>

nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :call CloseOnLast()<CR>
nnoremap <Leader>Q :q<CR>
nnoremap <Leader><C-O> :Bufonly<CR>

nnoremap <Leader>n :Files %:h<CR>
nnoremap <Leader>N :e %:h/

nnoremap <Leader>o o<esc>k
nnoremap <Leader>O O<esc>j

nnoremap <Leader>H H
nnoremap <Leader>L L
nnoremap <Leader>K HzzH
nnoremap <Leader>J LzzL

nnoremap <Leader>z 1z=

nmap <silent> <Leader>c <Plug>(qf_qf_toggle_stay)

nnoremap <Leader><C-]> :LspHover<CR>

nnoremap <Leader>it :IstanbulToggle<CR>
nnoremap <Leader>iu :IstanbulUpdate<CR>

" nnoremap <Leader>s :LspDocumentSymbol<Cr>
nnoremap <Leader>s :call LanguageClient_textDocument_documentSymbol()<Cr>
nnoremap <Leader><CR> :call LanguageClient_contextMenu()<Cr>

" }}}
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" FZF {{{

nnoremap <Leader>p :Buffers<CR>
nnoremap <Leader><C-P> :Commands<CR>
nnoremap <Leader><C-W> :Windows<CR>

" }}}
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Search {{{

nnoremap <Leader>r :%s/\v()
nnoremap <Leader>R :let v=winsaveview()<CR>:%s/<C-R><C-W>// <Bar>:call winrestview(v)<C-Left><C-Left><Left><Left>a<BS>
vnoremap <Leader>r :s/\v()

nnoremap <Leader>a :CtrlSF<Space>
" nnoremap <Leader>s :CtrlSFToggle<CR>

" }}}
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Easy Motion {{{

map <Leader>ee <Plug>(easymotion-bd-w)
nmap <Leader>ee <Plug>(easymotion-overwin-w)
nmap <Leader>ef <Plug>(easymotion-overwin-f2)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>h <Plug>(easymotion-linebackward)

" }}}
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Git {{{

nnoremap <Leader>gd :Gvdiff<CR>
nnoremap <Leader>gr :Gread<CR>
nnoremap <Leader>gb :Gblame<CR>
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gl :BCommits<CR>
nnoremap <Leader>gf :GFiles?<CR>
nnoremap <Leader>gt :SignifyToggleHighlight<CR>
nnoremap <Leader>gz :SignifyFold!<CR>
nnoremap <Leader>gc :Twiggy<CR>
nnoremap <Leader>gm :Magit<CR>zcgg
let g:magit_show_magit_mapping='<NOPE>'

function! CheckoutLine()
    let l:view = winsaveview()
    Gvdiff
    diffget
    only
    call winrestview(l:view)
endfunction

nnoremap <Leader>go :call CheckoutLine()<CR>

" }}}
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Google {{{

function! s:goog(pat, lucky)
    let l:q = '"'.substitute(a:pat, '["\n]', ' ', 'g').'"'
    let l:q = substitute(l:q, '[[:punct:] ]',
                \ '\=printf("%%%02X", char2nr(submatch(0)))', 'g')
    call system(printf('open "https://www.google.com/search?%sq=%s"',
                \ a:lucky ? 'btnI&' : '', l:q))
endfunction

nnoremap <leader>? :call <SID>goog(expand("<cWORD>"), 0)<cr>
nnoremap <leader>! :call <SID>goog(expand("<cWORD>"), 1)<cr>

" }}}
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Marks {{{

function s:Marks()
    marks abcdefghijklmnopqrstuvwxyz.ABCDEFGHIJKLMNOPQRSTUVWXYZ
    echo 'Mark: '
    let l:mark = nr2char(getchar())
    redraw

    execute 'normal! `' . l:mark

endfunction

command! Marks call s:Marks()

nnoremap <leader>m :Marks<CR>

" }}}
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" vim:foldmethod=marker:foldlevel=0

