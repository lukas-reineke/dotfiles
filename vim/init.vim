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
" Autocmds {{{

source ~/dotfiles/vim/autocmds.vim

" }}}
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Global Settings {{{

let g:python_host_prog = '~/.pyenv/versions/neovim2/bin/python'
let g:python3_host_prog = '~/.pyenv/versions/neovim3.8.5/bin/python'
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
set showtabline=0
set confirm
set virtualedit=block
set ignorecase
set smartcase
set infercase
set hlsearch
set incsearch
set inccommand=nosplit
set formatoptions=tcrqnbj
set viewoptions=
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
" silent !mkdir ~/.config/nvim/backups > /dev/null 2>&1
set undodir=~/.config/nvim/backups
set undofile
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
    \ 'vim',
    \ 'python',
    \ 'bash=sh',
    \ 'javascript',
    \ 'typescript',
    \ 'yaml',
    \ 'json',
    \ 'gql=graphql',
    \ 'graphql',
\ ]

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
set foldcolumn=0
set foldtext=fold#FoldText()

" }}}
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Chars {{{

set list
set listchars=eol:↴
set listchars+=tab:│⋅
set listchars+=trail:•
set listchars+=extends:❯
set listchars+=precedes:❮
set listchars+=nbsp:_
set listchars+=space:⋅
set showbreak=↳⋅
set conceallevel=2
set concealcursor=n
let g:indentLine_char = '│'
let g:indentLine_first_char = g:indentLine_char
let g:indentLine_showFirstIndentLevel = 1
let g:indentLine_color_gui = onedark#GetColors().cursor_grey.gui
let g:indentLine_bgcolor_gui = 'NONE'
let g:indentLine_setConceal = 0
let g:indentLine_fileTypeExclude = ['help', 'defx', 'vimwiki']
let g:indentLine_autoResetWidth = 0
let g:indent_blankline_space_char = ' '
let g:indent_blankline_debug = v:true

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

let g:ackprg = 'rg --vimgrep --no-heading --hidden --smart-case'
let g:incsearch#auto_nohlsearch = 1
let g:incsearch#magic = '\v'
let g:incsearch#consistent_n_direction = 1
let g:incsearch#do_not_save_error_message_history = 1

let g:splfy_no_matchinfo = 1

let g:Illuminate_ftblacklist = [ 'python', 'defx', 'javascript' ]

let g:Illuminate_ftHighlightGroups = {
    \ 'vim': ['vimVar', 'vimFBVar', 'vimString', 'vimLineComment',
    \         'vimFuncName', 'vimFunction', 'vimUserFunc', 'vimFunc'],
\ }

let g:Illuminate_delay = 0

" }}}
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Completion {{{

let g:echodoc#enable_at_startup = 1

let g:complete_parameter_use_typescript_for_javascript = 1

let g:UltiSnipsExpandTrigger = '<Tab>'
let g:UltiSnipsJumpForwardTrigger = '<Tab>'
let g:UltiSnipsJumpBackwardTrigger = '<S-Tab>'
let g:UltiSnipsSnippetsDir = '~/dotfiles/vim/ultisnips'
let g:UltiSnipsSnippetDirectories = [ 'ultisnips' ]

let g:go_code_completion_enabled = 0
let g:go_doc_keywordprg_enabled = 0
let g:go_fmt_autosave = 0
let g:go_highlight_extra_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_parameters = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_variable_declarations = 1
let g:go_highlight_variable_assignments = 1

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
\   'go': [ 'gofmt', 'golint', 'govet', 'gometalinter', 'staticcheck' ],
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
\   'go': [ 'gofmt', 'goimports' ],
\}
let g:ale_pattern_options_enabled = 1
let g:ale_disable_lsp = 1
let g:ale_sign_priority = 11
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
let g:ale_javascript_prettier_options = '--tab-width 4 --single-quote --trailing-comma all'
let g:ale_sign_error = '⭕'
let g:ale_sign_warning = '⭕'
let g:airline#extensions#ale#error_symbol = 'E '
let g:airline#extensions#ale#warning_symbol = 'W '
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
" Plugin settings {{{

" Markdown
let g:markdown_enable_insert_mode_mappings = 0

" Man
let g:no_man_maps = 1

" Json
let g:vim_json_syntax_conceal = 0
let g:vim_json_conceal = 0

" defx
call defx#custom#column('mark', {
\   'readonly_icon': '◆',
\   'selected_icon': '■',
\})
call defx#custom#column('indent', {
\   'indent': '    ',
\})
call defx#custom#option('_', {
\   'columns': 'indent:mark:icons:git:filename',
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

"EasyMotion
let g:EasyMotion_smartcase = 1
let g:EasyMotion_do_mapping = 0
let g:EasyMotion_keys = 'asdfghjklqwertyuiopzxcvbnm'

let g:signify_update_on_focusgained = 1
let g:signify_sign_add = '│'
let g:signify_sign_delete = g:signify_sign_add
let g:signify_sign_delete_first_line = g:signify_sign_add
let g:signify_sign_change = g:signify_sign_add
let g:signify_sign_changedelete = g:signify_sign_add
let g:gitgutter_map_keys = 0
let g:gitgutter_signs = 0

" poppy
let g:poppy_point_enable = 1

" FZF
let g:fzf_buffers_jump = 1
let g:fzf_action = {
\   'ctrl-q': function('quickfix#Build'),
\   'ctrl-z': 'tab split',
\   'ctrl-s': 'split',
\   'ctrl-v': 'vsplit',
\}
let g:fzf_layout = { 'window': 'call fzf#floating_window#Create()' }
let $FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS . ' --reverse --ansi'

let g:terraform_align = 1
let g:terraform_fmt_on_save = 1

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
\}
let g:AutoPairsDelete = {
\   '(':')',
\   '[':']',
\   '{':'}',
\   "'":"'",
\   '"':'"',
\   '`':'`',
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
let g:vista_echo_cursor = 0
let g:vista_close_on_jump = 1
let g:vista_blink = [1, 100]
let g:vista_sidebar_width = 50
let g:vista_icon_indent = ['╰─ ', '├─ ']
let g:vista_fzf_preview = ['right:50%']

let g:slime_target = 'tmux'
let g:slime_default_config = {'socket_name': 'default', 'target_pane': '{bottom}'}

let g:loaded_netrwPlugin=v:false

" }}}
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:conjoin_map_J = 'gJ'
let g:conjoin_map_gJ = '<con-nope>'

let wiki = {
\   'path': '~/vimwiki/',
\   'auto_tags': 1,
\   'auto_generate_links': 1,
\   'auto_generate_tags': 1,
\   'links_space_char': '-',
\}
" let wiki.nested_syntaxes = {
" \   'python': 'python',
" \   'javascript': 'javascript',
" \   'typescript': 'typescript',
" \   'bash': 'sh',
" \   'yaml': 'yaml',
" \   'json': 'json',
" \}
let g:vimwiki_list = [wiki]
let g:vimwiki_folding = 'custom'
let g:vimwiki_use_calendar = 0
let g:vimwiki_global_ext = 0
let g:vimwiki_valid_html_tags = 'b,i,s,u,sub,sup,kbd,br,hr,span'
" let g:vimwiki_conceal_pre = 1

let g:vimwiki_key_mappings = {
\   'all_maps': 1,
\   'global': 0,
\   'headers': 0,
\   'text_objs': 1,
\   'table_format': 0,
\   'table_mappings': 1,
\   'lists': 1,
\   'links': 0,
\   'html': 0,
\   'mouse': 1,
\}

let g:calendar_action = 'cal#Action'
let g:calendar_monday = 1
let g:calendar_navi = 'bottom'

command! CL CalendarH

command Japanese :call fcitx#ToggleInput()

command H :Helptags

command TOC :call man#show_toc()<CR>

command! Urls call fzf#urls#Open()
command! -nargs=* -bang RG call fzf#ripgrep#Search(<q-args>, <bang>0)
command! MarkdownHeadersFzf call fzf#headers#Show('markdown')
command! VimwikiHeadersFzf call fzf#headers#Show('vimwiki')

command! SpellClear call clearmatches()
command! Spell Codespell
command! SpellToggle :call spell#Toggle()

let g:gitHead = 'HEAD'
command! -nargs=* GitHead call git#SetHead(<q-args>)

" vim:foldmethod=marker:foldlevel=0

