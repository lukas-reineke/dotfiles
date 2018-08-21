
nnoremap <silent><buffer><expr> <CR> defx#do_action('open')
nnoremap <silent><buffer><expr> o defx#do_action('open')
nnoremap <silent><buffer><expr> K defx#do_action('new_directory')
nnoremap <silent><buffer><expr> N defx#do_action('new_file')
nnoremap <silent><buffer><expr> D defx#do_action('remove')
nnoremap <silent><buffer><expr> r defx#do_action('rename')
" nnoremap <silent><buffer><expr> h
" \ defx#do_action('cd', ['..'])
" nnoremap <silent><buffer><expr> ~
" \ defx#do_action('cd')
nnoremap <silent><buffer><expr> m defx#do_action('toggle_select') . 'j'
