"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Mappings {{{

" Leader Mappings
source $HOME/dotfiles/vim/mappings/leader.vim
" Normal Mappings
source $HOME/dotfiles/vim/mappings/normal.vim
" Visual Mappings
source $HOME/dotfiles/vim/mappings/visual.vim
" Command Mappings
source $HOME/dotfiles/vim/mappings/command.vim
" Instert Mappings
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

syntax enable
filetype plugin indent on
set synmaxcol=400
set spell
set history=10000
set undolevels=10000
set lazyredraw
set shortmess+=A
set noswapfile
set termguicolors
set noshowmode
set noshowcmd
set encoding=utf8
set t_ut=
set ttimeoutlen=0
set timeoutlen=500
set mouse=
set clipboard+=unnamedplus
set splitbelow
set splitright
set autoread
set cursorline
set hidden
set virtualedit=block
set ignorecase
set smartcase
set infercase
set hlsearch
set incsearch
set inccommand=nosplit
set grepprg=rg\ --vimgrep
set formatprg=par\ -w80rq
set formatoptions-=o
set nowrap
set whichwrap=b
set whichwrap+=h
set whichwrap+=l
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

" }}}
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Theme {{{

set background=dark
color base16-onedark
" highlight OverLength ctermbg=red ctermfg=white guibg=#592929
highlight CursorLine guibg='#22262d' guifg='#000'
highlight WinNormalNC guibg='#22262d' guifg='#777777'
highlight QuickFixLine guibg='#22262d' guifg='#000'
highlight Search guibg='#565c64' guifg='#000'
highlight ESearchMatch guibg='#565c64' guifg='#000'
highlight HighlightedyankRegion guibg='#565c64'
let g:airline_theme = 'bubblegum'
let g:airline_colornum_reversed = 1
let g:highlightedyank_highlight_duration = 100
" match OverLength /\%81v./
set winhighlight=NormalNC:WinNormalNC

augroup HiglightDebug
    autocmd!
    autocmd WinEnter,VimEnter * :silent! call matchadd('Todo', 'TODO', -1)
    autocmd WinEnter,VimEnter * :silent! call matchadd('Todo', 'DEBUG', -1)
augroup END

" }}}
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Fold {{{
"
set foldclose=all
set nofoldenable
set foldlevel=2
set foldmethod=indent
set foldnestmax=2
set foldopen=all
set foldminlines=0
let g:ip_skipfold = 1

" }}}
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Chars {{{

set list
set listchars=eol:⬎
set listchars+=tab:>-
set listchars+=trail:•
set listchars+=extends:❯
set listchars+=precedes:❮
set listchars+=nbsp:_
set listchars+=space:⋅
let g:indentLine_char = '│'
let g:indentLine_first_char = '│'
let g:indentLine_fileTypeExclude = [ 'json' ]
let g:indentLine_showFirstIndentLevel = 1

" }}}
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Search {{{

set wildmode=list:full
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

let g:splfy_no_matchinfo = 1

let g:anzu_enable_CursorMoved_AnzuUpdateSearchStatus = 1

call esearch#map('<leader>a', 'esearch')
let g:esearch#cmdline#help_prompt = 0
let g:esearch#out#win#open = 'enew'
let g:esearch#out#win#context_syntax_highlight = 1
let g:esearch#out#win#syntax_regeps = {
\   'typescript': '\%(\.ts\)$',
\   'javascript': '\%(\.js\)$',
\   'html': '\%(\.html\)$',
\   'scss': '\%(\.scss\)$',
\   'css': '\%(\.css\)$',
\   'json': '\%(\.json\)$',
\   'yaml': '\%(yaml\|\.yml\)$',
\   'sh': '\%(\.bash\|\.sh\)$',
\   'vim': '\%(\.vim\)$',
\   'python': '\%(\.py\)$',
\}

" }}}
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Completion {{{

let g:tsuquyomi_disable_default_mappings = 1
let g:tsuquyomi_shortest_import_path = 1
let g:tsuquyomi_completion_case_sensitive = 1
let g:tsuquyomi_single_quote_import = 1
let g:tsuquyomi_javascript_support = 1
let g:tsuquyomi_completion_detail = 1

let g:echodoc#enable_at_startup = 1

let g:complete_parameter_use_typescript_for_javascript = 1

let g:UltiSnipsExpandTrigger = '<Tab>'
let g:UltiSnipsJumpForwardTrigger = '<Tab>'
let g:UltiSnipsJumpBackwardTrigger = '<S-Tab>'
let g:UltiSnipsSnippetsDir = '~/dotfiles/vim/ultisnips'
let g:UltiSnipsSnippetDirectories = [ 'ultisnips' ]

let g:jedi#auto_vim_configuration = 0
let g:jedi#popup_on_dot = 0
" let g:jedi#completions_enabled = 0
let g:jedi#goto_command = "<C-]>"
let g:jedi#goto_assignments_command = ""
let g:jedi#goto_definitions_command = ""
let g:jedi#documentation_command = ""
let g:jedi#usages_command = ""
let g:jedi#completions_command = ""
let g:jedi#rename_command = ""

" }}}
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Linter {{{

let g:ale_linters = {
\   'javascript': [ 'eslint', 'flow' ],
\   'typescript': [ 'tslint', 'tsserver', 'typecheck' ],
\   'html': [ 'htmlhint' ]
\}
let g:ale_sign_error = '誤'
let g:ale_sign_warning = '危'
let g:airline#extensions#ale#error_symbol = '誤:'
let g:airline#extensions#ale#warning_symbol = '危:'
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1
let g:tsuquyomi_disable_quickfix = 1

" }}}
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" File Type Autocmd {{{

augroup FiletypeDetect
    autocmd!
    autocmd BufRead,BufNewFile .stylelintrc,.htmlhintrc set filetype=json
    autocmd BufRead,BufNewFile i3* set filetype=i3
    autocmd BufRead,BufNewFile *.tsx set filetype=typescript.jsx
    autocmd BufRead,BufNewFile * set formatoptions-=o
augroup END

" }}}
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin settings {{{

let g:vimfiler_as_default_explorer = 1
let g:vimfiler_tree_indentation = 4
let g:vimfiler_tree_opened_icon = '├'
let g:vimfiler_tree_closed_icon = '│'
let g:vimfiler_marked_file_icon = '┼'
let g:vimfiler_tree_leaf_icon = ''
call vimfiler#custom#profile('default', 'context', {
\   'safe' : 0,
\   'horizontal' : 1,
\   'find' : 1,
\   'force-quit' : 1,
\   'direction' : 'rightbelow',
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
\   'ctrl-v': 'vsplit'
\}

" Sparkup
let g:sparkupExecuteMapping = '<C-E>'
let g:sparkupNextMapping = '<C-2>'
let g:sparkupArgs = '--no-last-newline --open-empty-tags'

" JSX
let g:jsx_ext_required = 0

" Sandwich
let g:sandwich#recipes = deepcopy(g:sandwich#default_recipes)
let g:sandwich#recipes += [
\   {
\       'buns': [ '{ ', ' }' ],
\       'nesting': 1,
\       'match_syntax': 1,
\       'kind': [ 'add', 'replace' ],
\       'action': [ 'add' ],
\       'input': [ '{' ]
\   }, {
\       'buns': [ '[ ', ' ]' ],
\       'nesting': 1,
\       'match_syntax': 1,
\       'kind': [ 'add', 'replace' ],
\       'action': [ 'add' ],
\       'input': [ '[' ]
\   }, {
\       'buns': [ '( ', ' )' ],
\       'nesting': 1,
\       'match_syntax': 1,
\       'kind': [ 'add', 'replace' ],
\       'action': [ 'add' ],
\       'input': [ '(' ]
\   }, {
\       'buns': [ '{\s*', '\s*}' ],
\       'nesting': 1,
\       'regex': 1,
\       'match_syntax': 1,
\       'kind': [ 'delete', 'replace', 'textobj' ],
\       'action': [ 'delete' ],
\       'input': [ '{' ]
\   }, {
\       'buns': [ '\[\s*', '\s*\]' ],
\       'nesting': 1,
\       'regex': 1,
\       'match_syntax': 1,
\       'kind': [ 'delete', 'replace', 'textobj' ],
\       'action': [ 'delete' ],
\       'input': [ '[' ]
\   }, {
\       'buns': [ '(\s*', '\s*)' ],
\       'nesting': 1,
\       'regex': 1,
\       'match_syntax': 1,
\       'kind': [ 'delete', 'replace', 'textobj' ],
\       'action': [ 'delete' ],
\       'input': [ '(' ]
\   }
\]

" Winresizer
let g:winresizer_start_key = '<C-T>'

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

" Codi
let g:codi#rightsplit = 0

" Airline
let g:airline_detect_spell = 0
let g:airline_detect_spelllang = 0
let g:airline_section_x = 0
let g:airline_section_y = 0
let g:airline_section_z = 0
let g:airline_mode_map = {
\   '__': '-',
\   'n': 'ノーマル',
\   'i': 'インサート',
\   'R': 'リプレース',
\   'c': 'コマーンド',
\   'v': 'ビズアル',
\   'V': 'ビズアル',
\   '': 'ビズアル',
\   's': 'セレクト',
\   'S': 'セレクト',
\   '': 'セレクト',
\}
let g:airline#extensions#default#layout = [
\   [ 'a', 'c' ],
\   [ 'b', 'error', 'warning' ]
\]
let g:airline#extensions#branch#format = 'CustomBranchName'
function! CustomBranchName(name)
     return ''
endfunction
let g:airline#extensions#whitespace#enabled = 0

let g:tmuxline_preset = {
\   'a': '#{window_panes}',
\   'x': '#(cd #{pane_current_path} && git rev-parse --abbrev-ref HEAD)',
\   'win': '#I #{pane_title}',
\   'cwin': '#I #{pane_title}',
\   'options': {'status-justify': 'left'}
\}
let g:tmuxline_separators = {
\   'left': '',
\   'left_alt': '',
\   'right': '',
\   'right_alt': '',
\   'space': ' '
\}

" }}}
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" vim:foldmethod=marker:foldlevel=0

