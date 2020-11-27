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

let g:loaded_netrwPlugin=v:false
packadd cfilter

let g:lexima_no_default_rules = 1
call lexima#set_default_rules()
let g:completion_confirm_key = ''
imap <expr><silent><cr> pumvisible() ? complete_info()["selected"] != "-1" ?
\ "\<Plug>(completion_confirm_completion)" : "\<c-e>" : lexima#expand('<LT>CR>', 'i')

" }}}
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

lua require('init')

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
set winhighlight=NormalNC:WinNormalNC
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
set signcolumn=auto
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
set noshiftround
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
set dict=~/dotfiles/lib/10k.txt

" }}}
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Theme {{{

" color onedark
" let g:onedark_terminal_italics = 1
let g:highlightedyank_highlight_duration = 100
let g:markdown_fenced_languages = [
    \ 'vim',
    \ 'python',
    \ 'lua',
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
let g:indentLine_color_gui = luaeval('require "onedark".colors.cursor_grey')
" let g:indentLine_color_gui = onedark#GetColors().cursor_grey.gui
let g:indentLine_bgcolor_gui = 'NONE'
let g:indentLine_setConceal = 0
let g:indentLine_fileTypeExclude = ['help', 'defx', 'vimwiki']
let g:indentLine_autoResetWidth = 0
let g:indent_blankline_space_char = ' '
let g:indent_blankline_debug = v:true

let g:Hexokinase_optInPatterns = 'full_hex,rgb,rgba,hsl,hsla'

" }}}
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Search {{{

set pumblend=10
set wildoptions=pum
set wildmode=longest,full

let g:ackprg = 'rg --vimgrep --no-heading --hidden --smart-case'
let g:incsearch#auto_nohlsearch = 1
let g:incsearch#magic = '\v'
let g:incsearch#consistent_n_direction = 1
let g:incsearch#do_not_save_error_message_history = 1

let g:Illuminate_ftblacklist = [ 'python', 'defx', 'javascript', 'go', 'lua' ]

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
let g:echodoc#type = 'floating'

let g:UltiSnipsExpandTrigger = '<Tab>'
let g:UltiSnipsJumpForwardTrigger = '<Tab>'
let g:UltiSnipsJumpBackwardTrigger = '<S-Tab>'
let g:UltiSnipsSnippetsDir = '~/dotfiles/vim/ultisnips'
let g:UltiSnipsSnippetDirectories = [ 'ultisnips' ]

" }}}
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Linter {{{

let g:qf_nowrap = 0
let g:qf_max_height = 20

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

let g:openbrowser_default_search = 'duckduckgo'

let g:gitgutter_map_keys = 0
let g:gitgutter_sign_added = '│'
let g:gitgutter_sign_modified = '│'
let g:gitgutter_sign_removed = '│'
let g:gitgutter_sign_removed_first_line = '│'
let g:gitgutter_sign_removed_above_and_below = '│'
let g:gitgutter_sign_modified_removed = '│'

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

" Siganture
let g:SignatureForceRemoveGlobal = 1

" pasta
let g:pasta_disabled_filetypes = ['defx']

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

" Clever F
let g:clever_f_use_migemo = 1

let g:vista_default_executive = 'nvim_lsp'
let g:vista_echo_cursor = 0
let g:vista_close_on_jump = 1
let g:vista_blink = [1, 100]
let g:vista_sidebar_width = 50
let g:vista_icon_indent = ['╰─ ', '├─ ']
let g:vista_fzf_preview = ['right:50%']

let g:slime_target = 'tmux'
let g:slime_default_config = {'socket_name': 'default', 'target_pane': '{bottom}'}


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
let g:vimwiki_list = [wiki]
let g:vimwiki_folding = 'custom'
let g:vimwiki_use_calendar = 0
let g:vimwiki_global_ext = 0
let g:vimwiki_valid_html_tags = 'b,i,s,u,sub,sup,kbd,br,hr,span'

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
command! List call fzf#lists#Change()

command! SpellClear call clearmatches()
command! Spell Codespell
command! SpellToggle :call spell#Toggle()

let g:gitHead = 'HEAD'
command! -nargs=* -complete=customlist,fugitive#CompleteObject GitHead call git#SetHead(<q-args>)

" vim:foldmethod=marker:foldlevel=0

