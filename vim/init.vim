scriptencoding utf8
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Mappings {{{

source ~/dotfiles/vim/mappings/leader.vim
source ~/dotfiles/vim/mappings/normal.vim
source ~/dotfiles/vim/mappings/visual.vim
source ~/dotfiles/vim/mappings/command.vim
source ~/dotfiles/vim/mappings/insert.vim

" }}}
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins {{{

call plug#begin('~/.vimpkg/bundle')

source ~/dotfiles/vim/plugin-list.vim

call plug#end()

" }}}
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Functions {{{

source ~/dotfiles/vim/functions.vim

" }}}
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Global Settings {{{

let g:python_host_prog = '~/.pyenv/versions/neovim2/bin/python'
let g:python3_host_prog = '~/.pyenv/versions/neovim3/bin/python'
syntax enable
filetype plugin indent on
set omnifunc=syntaxcomplete#Complete
set completeopt=menuone,noinsert,noselect
set updatetime=0
set synmaxcol=400
set history=10000
set undolevels=10000
set lazyredraw
set shortmess+=A
set noswapfile
set termguicolors
set textwidth=80
set colorcolumn=+1
set noshowmode
set noshowcmd
set ttimeoutlen=0
set timeoutlen=500
set clipboard+=unnamedplus
set splitbelow
set splitright
set autoread
set cursorline
set hidden
set confirm
set virtualedit=block
set ignorecase
set smartcase
set infercase
set hlsearch
set incsearch
set inccommand=nosplit
set formatoptions-=o
set wrap
set breakindent
set linebreak
set whichwrap=b,h,l
set expandtab
set smarttab
set shiftwidth=4
set tabstop=4
set softtabstop=4
set smartindent
set number
set relativenumber
set scrolloff=8
set sidescrolloff=15
set sidescroll=5
silent !mkdir ~/.config/nvim/backups > /dev/null 2>&1
set undodir=~/.config/nvim/backups
set undofile
set path+=**
set virtualedit=onemore
set spellcapcheck=
set noruler
set grepprg=rg\ --vimgrep\ --no-heading\ --hidden

" }}}
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Theme {{{

color onedark
let g:airline_theme = 'onedark'
let g:onedark_terminal_italics = 1
let g:airline_colornum_reversed = 1
let g:highlightedyank_highlight_duration = 100
let g:markdown_fenced_languages = [
    \ 'python',
    \ 'bash=sh',
    \ 'javascript',
    \ 'typescript',
    \ 'yaml',
    \ 'json',
    \ 'gql=graphql',
    \ 'graphql',
\ ]
" let g:vimade = {
"     \ 'fadelevel': 0.8,
"     \ 'enablesigns': 1,
" \ }

augroup HiglightDebug
    autocmd!
    autocmd WinEnter,VimEnter * :silent! call matchadd('Todo', 'TODO', -1)
    autocmd WinEnter,VimEnter * :silent! call matchadd('Todo', '@TODO', -1)
    autocmd WinEnter,VimEnter * :silent! call matchadd('Todo', 'DEBUG', -1)
    autocmd WinEnter,VimEnter * :silent! call matchadd('Todo', '@DEBUG', -1)
    autocmd WinEnter,VimEnter * :highlight QuickScopePrimary gui=bold guifg=NONE
    autocmd WinEnter,VimEnter * :highlight QuickScopeSecondary gui=bold guifg=NONE
    autocmd CursorHold * silent call CocActionAsync('highlight')
augroup END

augroup cursorLine
    autocmd!
    autocmd VimEnter,BufEnter,BufWinEnter * setlocal cursorline
    autocmd WinLeave,BufLeave,BufWinLeave * setlocal nocursorline
augroup END

" }}}
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Fold {{{

set foldclose=all
set nofoldenable
set foldlevel=2
set foldmethod=indent
set foldnestmax=2
set foldopen=all
set foldminlines=0

" }}}
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Chars {{{

set list
set listchars=eol:↴
set listchars+=tab:>-
set listchars+=trail:•
set listchars+=extends:❯
set listchars+=precedes:❮
set listchars+=nbsp:_
set listchars+=space:⋅
set showbreak=↳⋅
set conceallevel=2
let g:indentLine_char = '│'
let g:indentLine_first_char = g:indentLine_char
let g:indentLine_showFirstIndentLevel = 1
let g:indentLine_color_gui = onedark#GetColors().cursor_grey.gui
let g:indentLine_bgcolor_gui = onedark#GetColors().black.gui
let g:indentLine_setConceal = 0
let g:indentLine_fileTypeExclude = ['help', 'defx']

" }}}
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Search {{{

set pumblend=10
set wildoptions=pum
set wildmode=longest,full
set wildignore=*.o,*.obj,*~
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*cache*
set wildignore+=*logs*
set wildignore+=*node_modules/**
set wildignore+=*bower_components/**
set wildignore+=*coverage/**
set wildignore+=*DS_Store*
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=*/tmp/**
set wildignore+=*.png,*.jpg,*.gif
set wildignore+=*.woff,*.woff2,*.ttf,*.eot
set wildignore+=*.so
set wildignore+=*.swp
set wildignore+=*.zip
set wildignore+=*/platforms/*
set wildignore+=*/dist/*
set wildignore+=*/doc/*
set wildignore+=*/dll/*
set wildignore+=*venv*

let g:ackprg = 'rg --vimgrep --no-heading --hidden'
let g:incsearch#auto_nohlsearch = 1
let g:incsearch#magic = '\v'
let g:incsearch#consistent_n_direction = 1
let g:incsearch#do_not_save_error_message_history = 1

let g:splfy_no_matchinfo = 1

let g:Illuminate_ftblacklist = [ 'python', 'vimfiler', 'javascript' ]

let g:Illuminate_ftHighlightGroups = {
    \ 'vim': ['vimVar', 'vimFBVar', 'vimString', 'vimLineComment',
    \         'vimFuncName', 'vimFunction', 'vimUserFunc', 'vimFunc'],
    \ 'javascript': ['javascriptIdentifierName', 'javascriptFuncArg']
\ }

let g:Illuminate_delay = 0

let g:ctrlsf_confirm_save = 0
let g:ctrlsf_regex_pattern = 1
let g:ctrlsf_default_root = 'project'
let g:ctrlsf_auto_focus = { 'at': 'start' }
let g:ctrlsf_mapping = {
    \ 'quit': '<space>q',
    \ 'next': 'J',
    \ 'prev': 'K',
\ }
function! g:CtrlSFAfterMainWindowInit()
    only
endfunction

" }}}
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Completion {{{

" let g:tsuquyomi_disable_default_mappings = 1
" let g:tsuquyomi_shortest_import_path = 1
" let g:tsuquyomi_completion_case_sensitive = 1
" let g:tsuquyomi_case_sensitive_imports = 1
" let g:tsuquyomi_single_quote_import = 1
" let g:tsuquyomi_javascript_support = 1
" let g:tsuquyomi_completion_detail = 1

let g:echodoc#enable_at_startup = 1

let g:complete_parameter_use_typescript_for_javascript = 1

let g:UltiSnipsExpandTrigger = '<Tab>'
let g:UltiSnipsJumpForwardTrigger = '<Tab>'
let g:UltiSnipsJumpBackwardTrigger = '<S-Tab>'
let g:UltiSnipsSnippetsDir = '~/dotfiles/vim/ultisnips'
let g:UltiSnipsSnippetDirectories = [ 'ultisnips' ]

let g:jedi#auto_vim_configuration = 0
let g:jedi#popup_on_dot = 0
let g:jedi#goto_command = '<C-]>'
let g:jedi#goto_assignments_command = ''
let g:jedi#goto_definitions_command = ''
let g:jedi#documentation_command = ''
let g:jedi#usages_command = ''
let g:jedi#completions_command = ''
let g:jedi#rename_command = ''

" }}}
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Linter {{{

let g:ale_linters = {
\   'vim': [ 'vint' ],
\   'javascript': [ 'eslint' ],
\   'typescript': [ 'eslint' ],
\   'json': [ 'jsonlint' ],
\   'html': [ 'htmlhint' ],
\   'scss': [ 'sasslint' ],
\   'graphql': [ 'eslint' ],
\   'python': [ 'flake8', 'mypy', 'pyls' ],
\   'sh': [ 'language_server', 'shellcheck' ],
\}
let g:ale_fixers = {
\   '*': [ 'trim_whitespace' ],
\   'javascript': [ 'prettier', 'eslint' ],
\   'typescript': [ 'prettier', 'eslint' ],
\   'typescriptreact': [ 'prettier' ],
\   'json': [ 'prettier'],
\   'scss': [ 'prettier' ],
\   'css': [ 'prettier' ],
\   'markdown': [ 'prettier' ],
\   'html': [ 'prettier' ],
\   'yaml': [ 'prettier' ],
\   'graphql': [ 'prettier' ],
\   'python': [ 'black' ],
\}
let g:ale_pattern_options_enabled = 1
let g:ale_disable_lsp = 1
let g:ale_pattern_options = {
\   '\.min\.(js\|css)$': {
\       'ale_linters': [],
\       'ale_fixers': []
\   },
\   'node_modules/.*': {
\       'ale_linters': [],
\       'ale_fixers': []
\   },
\   'package.json': {
\       'ale_fixers': []
\   },
\}
let g:ale_javascript_prettier_use_local_config = 1
let g:ale_javascript_prettier_options = '--tab-width 4 --single-quote --trailing-comma all --print-width ' . &textwidth
augroup prettier
    autocmd!
    autocmd OptionSet textwidth let g:ale_javascript_prettier_options = '--tab-width 4 --single-quote --trailing-comma all --print-width ' . &textwidth
augroup END
let g:ale_sign_error = '⭕'
let g:ale_sign_warning = '⭕'
let g:airline#extensions#ale#error_symbol = '誤:'
let g:airline#extensions#ale#warning_symbol = '危:'
" let g:ale_set_loclist = 0
" let g:ale_set_quickfix = 1
" let g:tsuquyomi_disable_quickfix = 1
let g:qf_nowrap = 0
let g:qf_max_height = 20
let g:ale_fix_on_save = 1
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 0
let g:ale_lint_on_enter = 0
let g:ale_lint_on_filetype_changed = 1
let g:ale_lint_on_insert_leave = 0
let g:ale_virtualtext_cursor = 1
let g:ale_virtualtext_prefix = '╸'
let g:ale_maximum_file_size = 100000
let g:ale_lsp_show_message_severity = 'warning'
let g:semshi#error_sign = 0
let g:semshi#mark_selected_nodes = 2

" }}}
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" File Type Autocmd {{{

" function! JavascriptOmnifunc()
"     let l:filetypeList = [ 'javascript', 'typescript', 'typescriptreact.typescript' ]
"     if index(l:filetypeList, &filetype) > -1
"         set omnifunc=tsuquyomi#complete
"     endif
" endfunction

function! RemoveQuickfixItem()
    let curqfidx = line('.') - 1
    let qfall = getqflist()
    call remove(qfall, curqfidx)
    call setqflist(qfall, 'r')
    execute curqfidx + 1 . 'cfirst'
    copen
endfunction

augroup FiletypeDetect
    autocmd!
    autocmd BufRead,BufNewFile .eslintrc,.stylelintrc,.htmlhintrc set filetype=json
    autocmd BufRead,BufNewFile *.tsx set filetype=typescript.tsx
    " autocmd BufRead,BufNewFile *.tsx set filetype=typescriptreact.typescript
    autocmd BufRead,BufNewFile *.jsx set filetype=javascript
    autocmd BufRead,BufNewFile * set formatoptions-=o
    " autocmd FileType javascript set omnifunc=tsuquyomi#complete
    " autocmd User LanguageClientTextDocumentDidOpenPost :call JavascriptOmnifunc()
    " autocmd FileType python set omnifunc=lsp#complete
    autocmd FileType qf nnoremap <silent><buffer> dd :call RemoveQuickfixItem()<CR>
augroup END

" }}}
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin settings {{{

" Man
let g:no_man_maps = 1

" Json
let g:vim_json_syntax_conceal = 0

" defx
call defx#custom#column('mark', {
\   'readonly_icon': '◆',
\   'selected_icon': '■',
\})
call defx#custom#column('indent', {
\   'indent': '    ',
\})
call defx#custom#option('_', {
\   'columns': 'indent:mark:icons:filename:git:type:size:time',
\})

let g:defx_icons_root_opened_tree_icon = '├'
let g:defx_icons_nested_opened_tree_icon = '├'
let g:defx_icons_nested_closed_tree_icon = '│'
let g:defx_icons_directory_icon = '│'
let g:defx_icons_parent_icon = '├'

call defx#custom#column('git', 'indicators', {
\   'Modified' : '◉',
\   'Staged'   : '✚',
\   'Untracked': '◈',
\   'Renamed'  : '➜',
\   'Unmerged' : '═',
\   'Ignored'  : '▨',
\   'Deleted'  : '✖',
\   'Unknown'  : '?'
\})

augroup defx
    autocmd!
    autocmd BufWritePost * call defx#redraw()
augroup END

"EasyMotion
let g:EasyMotion_smartcase = 1
let g:EasyMotion_do_mapping = 0
let g:EasyMotion_keys = 'asdfghjklqwertyuiopzxcvbnm'

" signify
augroup signify
    autocmd!
    autocmd FocusGained,cursormoved * :SignifyRefresh
augroup END
let g:signify_update_on_focusgained = 1
let g:signify_sign_add = '│'
let g:signify_sign_delete = g:signify_sign_add
let g:signify_sign_delete_first_line = g:signify_sign_add
let g:signify_sign_change = g:signify_sign_add
let g:signify_sign_changedelete = g:signify_sign_add
let g:gitgutter_map_keys = 0
let g:gitgutter_signs = 0

" poppy
augroup poppy
    autocmd!
    autocmd cursormoved * call PoppyInit()
augroup END
let g:poppy_point_enable = 1

" FZF
let g:fzf_buffers_jump = 1
function! s:build_quickfix_list(lines)
    call setqflist(map(copy(a:lines), '{ "filename": v:val, "lnum": 1, "col": 1 }'))
    copen
    cc
endfunction
let g:fzf_action = {
\   'ctrl-q': function('s:build_quickfix_list'),
\   'ctrl-z': 'tab split',
\   'ctrl-s': 'split',
\   'ctrl-v': 'vsplit',
\}
function! CreateCenteredFloatingWindow()
    let width = min([&columns - 4, max([80, &columns - 20])])
    let height = min([&lines - 4, max([20, &lines - 50])])
    let top = (&lines / 6) - 1
    let left = (&columns - width) / 2
    let opts = {
    \   'relative': 'editor',
    \   'row': top,
    \   'col': left,
    \   'width': width,
    \   'height': height,
    \   'style': 'minimal',
    \}

    let top = '╭' . repeat('─', width - 2) . '╮'
    let mid = '│' . repeat(' ', width - 2) . '│'
    let bot = '╰' . repeat('─', width - 2) . '╯'
    let lines = [top] + repeat([mid], height - 2) + [bot]
    let s:buf = nvim_create_buf(v:false, v:true)
    call nvim_buf_set_lines(s:buf, 0, -1, v:true, lines)
    call nvim_open_win(s:buf, v:true, opts)
    set winhl=Normal:Floating
    let opts.row += 1
    let opts.height -= 2
    let opts.col += 2
    let opts.width -= 4
    call nvim_open_win(nvim_create_buf(v:false, v:true), v:true, opts)
    augroup fzf
        autocmd!
        autocmd BufWipeout <buffer> exe 'bw '.s:buf
    augroup END
endfunction
let g:fzf_layout = { 'window': 'call CreateCenteredFloatingWindow()' }
let $FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS . ' --reverse --ansi'

function! Fzf_dev(path)
    let s:path = a:path
    let s:files_status = {}

    function! s:files(path)
        let l:statuses_str = system('git -c color.status=false -C ' . $PWD . ' status -s')
        for l:status_line in split(l:statuses_str, '\n')
            let s:files_status[split(l:status_line, ' ')[1]] = split(l:status_line, ' ')[0]
        endfor

        if a:path ==? 'git'
            let l:files = split(system('git diff --name-only ' .. g:gitHead), '\n')
        else
            let l:files = split(system($FZF_DEFAULT_COMMAND . ' -- ' . a:path), '\n')
        end
        return s:prepend_icon(l:files)
    endfunction

    function! s:prepend_icon(candidates)
        let l:result = []
        for l:candidate in a:candidates
            let l:filename = fnamemodify(l:candidate, ':p:t')
            let l:git_icon = get(s:files_status, l:candidate, ' ')
            let l:icon = WebDevIconsGetFileTypeSymbol(l:filename, isdirectory(l:filename))
            let l:color_map = {
            \   '': '[0;36m[0m',
            \   '': '[0;97m[0m',
            \   '': '[0;35m[0m',
            \   '': '[0;36m[0m',
            \   '': '[0;34m[0m',
            \   '': '[0;33m[0m',
            \   '': '[0;32m[0m',
            \   '': '[0;33m[0m',
            \   'M': '[0;33mM[0m',
            \   'D': '[0;31mD[0m',
            \   '??': '[0;34m?[0m',
            \}
            call add(
            \   l:result,
            \   printf(
            \       '%s %s %s',
            \       get(l:color_map, l:git_icon, '[0;32m' . l:git_icon . '[0m'),
            \       get(l:color_map, l:icon, '[0;31m' . l:icon . '[0m'),
            \       l:candidate
            \   )
            \)
        endfor

        return l:result
    endfunction

    function! s:map_file(_key, file)
        let l:pos = stridx(a:file, ' ')
        return a:file[pos+1:-1]
    endfunction

    function! s:multi_edit_files(files)
        if len(a:files) == 1
            execute 'silent e' s:map_file('', a:files[0])
            if s:path ==? 'git'
                sleep 100m
                execute 'normal gg'
                execute "normal \<plug>(signify-next-hunk)"
            end
        else
            call setqflist(
            \   map(
            \       map(copy(a:files), function('s:map_file')),
            \       '{ "filename": v:val, "lnum": 1, "col": 1 }',
            \   )
            \)
            copen
            cc
        end
    endfunction

    if a:path ==? 'git'
        let l:fzf_files_options = '--preview "bat --italic-text=always --style=numbers,changes --color always {2..-1} | grep -A5 -B5 --color=never -P \"^..\d+.{0,30}[\+|\_|~]\""'
    else
        let l:fzf_files_options = ''
    end

    call fzf#run(fzf#wrap({
    \   'source': <sid>files(a:path),
    \   'sink*': function('s:multi_edit_files'),
    \   'options': '--multi ' . l:fzf_files_options,
    \   'window': 'call CreateCenteredFloatingWindow()',
    \}))

endfunction

let g:clap_layout = {'width': '80%', 'height': '45%', 'row': '15%', 'col': '10%'}
let g:clap_enable_icon=1
let g:clap_provider_grep_enable_icon=1
let g:clap_bg = { 'guibg': onedark#GetColors().black.gui }
let g:clap_theme = {
\   'display': g:clap_bg,
\   'input': g:clap_bg,
\   'spinner': g:clap_bg,
\   'search_text': g:clap_bg,
\   'preview': g:clap_bg,
\   'selected': { 'guibg': onedark#GetColors().dark_black.gui },
\   'current_selection': { 'guibg': onedark#GetColors().dark_black.gui },
\}
let g:clap_fuzzy_match_hl_groups = [
\   [ onedark#GetColors().green.cterm, onedark#GetColors().green.gui ],
\]
let g:clap_prompt_format = '%provider_id%> '
let g:clap_disable_run_rooter = v:true

" Lion
let g:lion_squeeze_spaces = 1

" Siganture
let g:SignatureForceRemoveGlobal = 1

" pasta
let g:pasta_disabled_filetypes = ['defx']

" Sparkup
let g:sparkupExecuteMapping = '<C-E>'
let g:sparkupNextMapping = '<C-2>'
let g:sparkupArgs = '--no-last-newline --open-empty-tags'

" Sandwich
let g:sandwich#recipes = deepcopy(g:sandwich#default_recipes)
let g:sandwich#recipes += [
\   {
\       'buns': [ '{ ', ' }' ],
\       'nesting': 1,
\       'match_syntax': 1,
\       'kind': [ 'add', 'replace' ],
\       'action': [ 'add' ],
\       'input': [ '{' ],
\   }, {
\       'buns': [ '[ ', ' ]' ],
\       'nesting': 1,
\       'match_syntax': 1,
\       'kind': [ 'add', 'replace' ],
\       'action': [ 'add' ],
\       'input': [ '[' ],
\   }, {
\       'buns': [ '( ', ' )' ],
\       'nesting': 1,
\       'match_syntax': 1,
\       'kind': [ 'add', 'replace' ],
\       'action': [ 'add' ],
\       'input': [ '(' ],
\   }, {
\       'buns': [ '{\s*', '\s*}' ],
\       'nesting': 1,
\       'regex': 1,
\       'match_syntax': 1,
\       'kind': [ 'delete', 'replace', 'textobj' ],
\       'action': [ 'delete' ],
\       'input': [ '{' ],
\   }, {
\       'buns': [ '\[\s*', '\s*\]' ],
\       'nesting': 1,
\       'regex': 1,
\       'match_syntax': 1,
\       'kind': [ 'delete', 'replace', 'textobj' ],
\       'action': [ 'delete' ],
\       'input': [ '[' ],
\   }, {
\       'buns': [ '(\s*', '\s*)' ],
\       'nesting': 1,
\       'regex': 1,
\       'match_syntax': 1,
\       'kind': [ 'delete', 'replace', 'textobj' ],
\       'action': [ 'delete' ],
\       'input': [ '(' ],
\   }
\]

" AutoPairs
let g:AutoPairs = {
\   '[':']',
\   '{':'}',
\   "'":"'",
\   '"':'"',
\   '`':'`',
\   '<': '>',
\}
let g:AutoPairsDelete = {
\   '(':')',
\   '[':']',
\   '{':'}',
\   "'":"'",
\   '"':'"',
\   '`':'`',
\   '<': '>',
\}
let g:AutoPairsCenterLine = 0
let g:AutoPairsSkipCharacter = 0
let g:AutoPairsMoveCharacter = ''

" Clever F
let g:clever_f_use_migemo = 1

" Airline
let g:airline_detect_spell = 0
let g:airline_detect_spelllang = 0
let g:airline_section_x = 0
let g:airline_section_y = 0
let g:airline_section_z = 0
let g:airline_mode_map = {
\   '__': '❱',
\   'n': '❱',
\   'i': '❱',
\   'R': '❱',
\   'c': '❱',
\   'v': '❱',
\   'V': '❱',
\   '': '❱',
\   's': '❱',
\   'S': '❱',
\   '': '❱',
\}
let g:airline#extensions#default#layout = [
\   [ 'a', 'c' ],
\   [ 'error', 'warning' ],
\]
let g:airline#extensions#whitespace#enabled = 0


let g:vista_default_executive = 'coc'
let g:vista_close_on_jump = 1
let g:vista_blink = [1, 100]
let g:vista_sidebar_width = 50
let g:vista_icon_indent = ['╰─ ', '├─ ']

let g:slime_target = 'tmux'
let g:slime_default_config = {'socket_name': 'default', 'target_pane': '{bottom}'}

" }}}
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" vim:foldmethod=marker:foldlevel=0

