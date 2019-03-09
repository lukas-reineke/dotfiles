scriptencoding utf8
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Mappings {{{

source $HOME/dotfiles/vim/mappings/leader.vim
source $HOME/dotfiles/vim/mappings/normal.vim
source $HOME/dotfiles/vim/mappings/visual.vim
source $HOME/dotfiles/vim/mappings/command.vim
source $HOME/dotfiles/vim/mappings/insert.vim

" }}}
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins {{{

call plug#begin('~/.vimpkg/bundle')

source $HOME/dotfiles/vim/plugin-list.vim

call plug#end()

" }}}
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Functions {{{

source $HOME/dotfiles/vim/functions.vim

" }}}
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Global Settings {{{

let g:python_host_prog = '/home/lukas/.pyenv/versions/neovim2/bin/python'
let g:python3_host_prog = '/home/lukas/.pyenv/versions/neovim3/bin/python'
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
set grepprg=rg\ --vimgrep
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

" }}}
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Theme {{{

color onedark
let g:airline_theme = 'onedark'
let g:onedark_terminal_italics = 1
let g:airline_colornum_reversed = 1
let g:highlightedyank_highlight_duration = 100
let g:markdown_fenced_languages = ['python', 'bash=sh', 'javascript', 'typescript', 'yaml', 'json']

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
let g:indentLine_char = '│'
let g:indentLine_first_char = g:indentLine_char
let g:indentLine_showFirstIndentLevel = 1
let g:indentLine_color_gui = onedark#GetColors().cursor_grey.gui
let g:indentLine_bgcolor_gui = onedark#GetColors().black.gui

" }}}
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Search {{{

set wildmode=list:longest,full
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

let g:incsearch#auto_nohlsearch = 1
let g:incsearch#magic = '\v'
let g:incsearch#consistent_n_direction = 1
let g:incsearch#do_not_save_error_message_history = 1

let g:splfy_no_matchinfo = 1

let g:Illuminate_ftblacklist = [ 'python', 'vimfiler', 'javascript']

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
\   'javascript': [ 'eslint', 'flow', 'tsserver' ],
\   'typescript': [ 'tslint', 'tsserver', 'typecheck' ],
\   'typescriptreact': [ 'tslint', 'tsserver', 'typecheck' ],
\   'json': [ 'jsonlint' ],
\   'html': [ 'htmlhint' ],
\   'scss': [ 'sasslint' ],
\   'python': [ 'flake8', 'mypy', 'pyls' ],
\   'sh': ['language_server', 'shellcheck'],
\}
let g:ale_fixers = {
\   '*': [ 'trim_whitespace' ],
\   'javascript': ['prettier'],
\   'typescript': ['prettier'],
\   'typescriptreact': ['prettier'],
\   'json': ['prettier'],
\   'scss': [ 'prettier' ],
\   'css': [ 'prettier' ],
\   'markdown': [ 'prettier' ],
\   'html': [ 'prettier' ],
\   'yaml': [ 'prettier' ],
\   'python': ['black'],
\}
let g:ale_pattern_options_enabled = 1
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
let g:ale_fix_on_save = 1
let g:ale_lint_on_text_changed = 0
let g:ale_lint_on_save = 1
let g:ale_virtualtext_cursor = 1
let g:ale_virtualtext_prefix = '╸'
let g:semshi#error_sign = 0
let g:semshi#mark_selected_nodes = 2

" }}}
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" File Type Autocmd {{{

function! JavascriptOmnifunc()
    let l:filetypeList = [ 'javascript', 'typescript', 'typescriptreact.typescript' ]
    if index(l:filetypeList, &filetype) > -1
        set omnifunc=tsuquyomi#complete
    endif
endfunction

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
    autocmd BufRead,BufNewFile .stylelintrc,.htmlhintrc set filetype=json
    autocmd BufRead,BufNewFile requirements.txt set filetype=python
    autocmd BufRead,BufNewFile *.tsx set filetype=typescriptreact.typescript
    autocmd BufRead,BufNewFile .eslintrc set filetype=json
    autocmd BufRead,BufNewFile * set formatoptions-=o
    " autocmd FileType javascript set omnifunc=tsuquyomi#complete
    autocmd User LanguageClientTextDocumentDidOpenPost :call JavascriptOmnifunc()
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

" vimfiler
let g:vimfiler_as_default_explorer = 1
let g:vimfiler_tree_indentation = 4
let g:vimfiler_tree_opened_icon = '├'
let g:vimfiler_tree_closed_icon = '│'
let g:vimfiler_marked_file_icon = '┼'
let g:vimfiler_tree_leaf_icon = ''
let g:vimfiler_ignore_pattern = []
call vimfiler#custom#profile('default', 'context', {
\   'safe': 0,
\   'horizontal': 1,
\   'find': 1,
\   'force-quit': 1,
\   'direction': 'rightbelow',
\})

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
let g:fzf_action = {
\   'ctrl-z': 'tab split',
\   'ctrl-s': 'split',
\   'ctrl-v': 'vsplit',
\}

" Lion
let g:lion_squeeze_spaces = 1

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
let g:airline#extensions#branch#format = 'CustomBranchName'
function! CustomBranchName(name)
    return ''
endfunction
let g:airline#extensions#whitespace#enabled = 0


let g:vista_default_executive = 'coc'
let g:vista_close_on_jump = 1
let g:vista_blink = [1, 100]
let g:vista_sidebar_width = 50
let g:vista_icon_indent = ['╰─ ', '├─ ']

" let g:tmuxline_preset = {
" \   'a': '#{window_panes}',
" \   'x': '#(cd #{pane_current_path} && git rev-parse --abbrev-ref HEAD)',
" \   'win': '│ #I #{pane_title}',
" \   'cwin': '│ #I #{pane_title}',
" \   'options': {'status-justify': 'left'},
" \}
" let g:tmuxline_separators = {
" \   'left': '',
" \   'left_alt': '',
" \   'right': '',
" \   'right_alt': '',
" \   'space': ' ',
" \}

" }}}
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Language Server {{{

" \   'python':     [ 'pyls', '-vv', '--log-file', '/tmp/pyls.log' ],
" \ 'javascript': ['node', $HOME . '/dev/javascript-typescript-langserver/lib/language-server-stdio'],
" \   'javascript': [ 'typescript-language-server', '--stdio', '--tsserver-log-file', '/tmp/tsserver.log', '--log-level', '1' ],
" \   'javascript': [ 'typescript-language-server', '--stdio', '--tsserver-log-file', '/tmp/tsserver.log', '--log-level', '4', '--tsserver-log-verbosity', 'verbose' ],
" let g:LanguageClient_diagnosticsEnable = 0
" let g:LanguageClient_rootMarkers = ['.git', 'package.json']
" " let g:LanguageClient_settingsPath = '.ls-settings.json'
" " \   'scss':       [ 'css-languageserver', '--stdio' ],
" " \   'css':        [ 'css-languageserver', '--stdio' ],
" let g:LanguageClient_loggingFile = '/tmp/language-client.log'
" let g:LanguageClient_serverCommands = {
" \   'javascript': [ 'typescript-language-server', '--stdio' ],
" \   'typescript': [ 'typescript-language-server', '--stdio' ],
" \   'json':       [ 'json-languageserver', '--stdio' ],
" \   'html':       [ 'html-languageserver', '--stdio' ],
" \   'python':     [ 'pyls' ],
" \   'sh':         [ 'bash-language-server', 'start' ],
" \   'go':         [ 'go-langserver' ],
" \}

" let g:LanguageClient_diagnosticsDisplay = {
" \   1: { 'signTexthl': 'Error', 'signText': '⭕' },
" \   2: { 'signTexthl': 'Todo',  'signText': '⭕' },
" \   3: { 'signTexthl': 'Todo',  'signText': '⭕' },
" \   4: { 'signTexthl': 'Todo',  'signText': '⭕' },
" \}

" }}}
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" vim:foldmethod=marker:foldlevel=0

