"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Mappings {{{

" Leader Mappings
so $HOME/dotfiles/vim/mappings/leader.vim
" Normal Mappings
so $HOME/dotfiles/vim/mappings/normal.vim
" Visual Mappings
so $HOME/dotfiles/vim/mappings/visual.vim
" Command Mappings
so $HOME/dotfiles/vim/mappings/command.vim
" Instert Mappings
so $HOME/dotfiles/vim/mappings/insert.vim

" }}}
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins {{{

call plug#begin('~/.vimpkg/bundle')

so $HOME/dotfiles/vim/plugin-list.vim

call plug#end()

" }}}
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Functions {{{

so $HOME/dotfiles/vim/functions.vim

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
highlight Folded  ctermfg=cyan ctermbg=black
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
let g:indentLine_fileTypeExclude = ['json']
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
" let g:over_command_line_prompt = ''

call esearch#map('<leader>a', 'esearch')
let g:esearch#cmdline#help_prompt = 0
let g:esearch#out#win#open = 'enew'
let g:esearch#out#win#context_syntax_highlight = 1
let g:esearch#out#win#syntax_regeps = {
            \ 'typescript': '\%(\.ts\)$',
            \ 'javascript': '\%(\.js\)$',
            \ 'html': '\%(\.html\)$',
            \ 'scss': '\%(\.scss\)$',
            \ 'css': '\%(\.css\)$',
            \ 'json': '\%(\.json\)$',
            \ 'yaml': '\%(yaml\|\.yml\)$',
            \ 'sh': '\%(\.bash\|\.sh\)$',
            \ 'vim': '\%(\.vim\)$',
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

let g:tern_show_signature_in_pum = '0'

let g:deoplete#enable_at_startup = 1
let g:deoplete#disable_auto_complete = 1
let g:deoplete#enable_camel_case = 1

let g:jsdoc_allow_input_prompt = 1
let g:jsdoc_input_description = 1
let g:jsdoc_additional_descriptions = 1
let g:jsdoc_enable_es6 = 1

let g:UltiSnipsExpandTrigger = '<Tab>'
let g:UltiSnipsJumpForwardTrigger = '<Tab>'
let g:UltiSnipsJumpBackwardTrigger = '<S-Tab>'
let g:UltiSnipsSnippetsDir = '~/dotfiles/vim/ultisnips'
let g:UltiSnipsSnippetDirectories = ['ultisnips']

" }}}
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Linter {{{

let g:ale_linters = {
\   'javascript': ['eslint', 'flow'],
\   'typescript': ['tslint', 'tsserver', 'typecheck'],
\   'html': ['htmlhint']
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
            \ 'safe' : 0,
            \ 'horizontal' : 1,
            \ 'find' : 1,
            \ 'force-quit' : 1,
            \ 'direction' : 'rightbelow',
            \ })


" " Netrw
" let g:netrw_winsize = 41
" let g:netrw_banner = 0
" let g:netrw_liststyle = 0
" " let g:netrw_liststyle = 3
" let g:netrw_sort_sequence = '[\/]$,*'
" let g:netrw_browse_split = 4
" let g:netrw_keepdir = 0

"EasyMotion
let g:EasyMotion_smartcase = 1
let g:EasyMotion_do_mapping = 0
let g:EasyMotion_keys = 'asdfghjklqwertyuiopzxcvbnm'

" signify
augroup signify
    autocmd!
    autocmd FocusGained,cursormoved * :SignifyRefresh
augroup END
let g:signify_realtime = 1

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
\   'ctrl-x': 'split',
\   'ctrl-v': 'vsplit'
\}

" Sparkup
let g:sparkupExecuteMapping = '<C-E>'
let g:sparkupNextMapping = '<C-R>'
let g:sparkupArgs = '--no-last-newline --open-empty-tags'

" Sandwich
let g:sandwich#recipes = deepcopy(g:sandwich#default_recipes)
let g:sandwich#recipes += [
\   {
\       'buns'        : ['(', ')'],
\       'motionwise'  : ['line'],
\       'kind'        : ['add'],
\       'linewise'    : 1,
\       'command'     : ["'[+1,']-1normal! >>"],
\   },
\   {
\       'buns'        : ['(', ')'],
\       'motionwise'  : ['line'],
\       'kind'        : ['delete'],
\       'linewise'    : 1,
\       'command'     : ["'[,']normal! <<"],
\   },
\   {
\       'buns'        : ['{', '}'],
\       'motionwise'  : ['line'],
\       'kind'        : ['add'],
\       'linewise'    : 1,
\       'command'     : ["'[+1,']-1normal! >>"],
\   },
\   {
\       'buns'        : ['{', '}'],
\       'motionwise'  : ['line'],
\       'kind'        : ['delete'],
\       'linewise'    : 1,
\       'command'     : ["'[,']normal! <<"],
\   },
\   {
\       'buns'        : ['[', ']'],
\       'motionwise'  : ['line'],
\       'kind'        : ['add'],
\       'linewise'    : 1,
\       'command'     : ["'[+1,']-1normal! >>"],
\   },
\   {
\       'buns'        : ['[', ']'],
\       'motionwise'  : ['line'],
\       'kind'        : ['delete'],
\       'linewise'    : 1,
\       'command'     : ["'[,']normal! <<"],
\   },
\   {
\       'external': ['it', 'at'],
\       'noremap' : 1,
\       'filetype': ['html'],
\       'input'   : ['t'],
\   }
\]

" Winresizer
let g:winresizer_start_key = '<C-T>'

" AutoPairs
let g:AutoPairs = {'[':']', '{':'}',"'":"'",'"':'"', '`':'`', '<': '>', '(': ')'}
let g:AutoPairsCenterLine = 0
let g:AutoPairsSkipCharacter = 0

" Clever F
let g:clever_f_use_migemo = 1

" Airline
let g:airline_detect_spell = 0
let g:airline_detect_spelllang = 0
let g:airline_section_x = 0
let g:airline_section_y = 0
let g:airline_section_z = 0
let g:airline_mode_map = {
            \ '__': '-',
            \ 'n': '正則',
            \ 'i': '入る',
            \ 'R': '代る',
            \ 'c': 'C',
            \ 'v': '選択',
            \ 'V': '選択',
            \ '': '選択',
            \ 's': 'S',
            \ 'S': 'S',
            \ '': 'S',
            \ }
let g:airline#extensions#default#layout = [
            \ [ 'a', 'c' ],
            \ [ 'b', 'error', 'warning' ]
            \ ]
" let g:airline_section_c = '%t'
let g:airline#extensions#branch#format = 'CustomBranchName'
function! CustomBranchName(name)
     return ''
endfunction

let g:airline#extensions#whitespace#enabled = 0

let g:tmuxline_preset = {
            \ 'a': '#{window_panes}',
            \ 'x': '#(cd #{pane_current_path} && git rev-parse --abbrev-ref HEAD)',
            \ 'win': '#I #{pane_title}',
            \ 'cwin': '#I #{pane_title}',
            \ 'options': {'status-justify': 'left'}
            \ }
let g:tmuxline_separators = {
            \ 'left': '',
            \ 'left_alt': '',
            \ 'right': '',
            \ 'right_alt': '',
            \ 'space': ' '}

" }}}
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" vim:foldmethod=marker:foldlevel=0

