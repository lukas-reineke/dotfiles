setlocal nobuflisted
setlocal bufhidden=delete

nnoremap <silent><buffer><expr> - defx#do_action('cd', ['..'])
nnoremap <silent><buffer><expr> <ESC> defx#do_action('quit')
nnoremap <silent><buffer><expr> q defx#do_action('quit')

nnoremap <silent><buffer><expr> <CR> defx#is_directory() ?
\   defx#do_action('open_or_close_tree') . 'j' :
\   defx#do_action('open')
nnoremap <silent><buffer><expr> o defx#is_directory() ?
\   defx#do_action('open_or_close_tree') . 'j' :
\   defx#do_action('open')


nnoremap <silent><buffer><expr> s defx#do_action('multi', [['open', 'split'], 'quit'])
nnoremap <silent><buffer><expr> N defx#do_action('new_multiple_files')
nnoremap <silent><buffer><expr> D defx#do_action('remove')
nnoremap <silent><buffer><expr> r defx#do_action('rename')
nnoremap <silent><buffer><expr> M defx#do_action('toggle_select') . 'j'
xnoremap <silent><buffer><expr> M defx#do_action('toggle_select_visual')

nnoremap <silent><buffer><expr><nowait> m defx#do_action('move')
nnoremap <silent><buffer><expr> y defx#do_action('copy')
nnoremap <silent><buffer><expr> p defx#do_action('paste')

nmap <buffer><silent> gk <Plug>(defx-git-prev)
nmap <buffer><silent> gj <Plug>(defx-git-next)
nmap <buffer> ga <Plug>(defx-git-stage)
nmap <buffer> gr <Plug>(defx-git-reset)
nmap <buffer> gu <Plug>(defx-git-discard)

call defx#custom#column('filename', {
\   'min_width': 60,
\   'max_width': winwidth(0),
\})
