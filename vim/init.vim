"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

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


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin('~/.vimpkg/bundle')

so $HOME/dotfiles/vim/plugin-list.vim

call plug#end()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

so $HOME/dotfiles/vim/functions.vim


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Global Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

syntax on
set synmaxcol=200
set spell
set history=1000
set undolevels=1000
filetype plugin indent on
set lazyredraw
set shortmess+=A
set conceallevel=0
set noswapfile
set termguicolors
set noshowmode
set showtabline=0
let g:airline_theme = 'bubblegum'
set background=dark
color base16-onedark
set grepprg=rg\ --vimgrep

" Wrapping
set nowrap
set whichwrap=b
set whichwrap+=h
set whichwrap+=l

" ================ Chars ========================
set list
set listchars=eol:⬎
set listchars+=tab:>-
set listchars+=trail:•
set listchars+=extends:>
set listchars+=precedes:<
set listchars+=nbsp:_
set listchars+=space:⋅
let g:indentLine_char = '│'

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
hi Search guibg='#565c64' guifg='#000'
set icm=split
let g:vim_search_pulse_disable_auto_mappings = 1
let g:incsearch#auto_nohlsearch = 1
let g:vim_search_pulse_mode = 'pattern'

" ================ Tabs ========================
set expandtab
set smarttab
set shiftwidth=4
set tabstop=4
set softtabstop=4
set smartindent
set nofoldenable

" ================ Line Numbers ========================
set number
set relativenumber

" ================ Scrolling ========================
set scrolloff=8
set sidescrolloff=15
set sidescroll=5

" ================ textwidth for ========================
set formatprg=par\ -w80rq

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Completion
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:tsuquyomi_disable_default_mappings = 1
let g:tsuquyomi_shortest_import_path = 1
let g:tsuquyomi_completion_case_sensitive = 1
let g:tsuquyomi_single_quote_import = 1
let g:tern_show_signature_in_pum = '0'
let g:deoplete#enable_at_startup = 1
let g:tsuquyomi_javascript_support = 1
let g:tsuquyomi_completion_detail = 1
let g:deoplete#disable_auto_complete = 1
let g:deoplete#enable_camel_case = 1
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

let g:jsdoc_allow_input_prompt = 1
let g:jsdoc_input_description = 1
let g:jsdoc_additional_descriptions = 1
let g:jsdoc_enable_es6 = 1

augroup completeopt
    autocmd FileType css,scss setlocal iskeyword=@,48-57,_,-,?,!,192-255
    autocmd FileType css,scss setlocal completeopt+=menu,preview
    autocmd FileType typescript setlocal completeopt+=menu,preview
    autocmd FileType javascript setlocal completeopt+=menu
    autocmd FileType javascript setlocal completeopt-=preview
augroup end

augroup omnifuncs
    autocmd!
    autocmd FileType css,scss setlocal omnifunc=csscomplete#CompleteCSS
    autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
    autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
    autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
    autocmd FileType javascript setlocal omnifunc=tern#Complete
augroup end


" ================ Ignore ========================
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


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" ================ Nerd Tree ========================
let NERDTreeShowHidden=1
let g:NERDTreeWinSize=50

" ================ Comments ========================
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1

" ================ ALE Lint ========================
let g:ale_linters = {
\   'javascript': ['eslint'],
\   'typescript': ['tslint', 'tsuquyomi'],
\}
let g:ale_sign_error = '誤'
let g:ale_sign_warning = '危'
let g:airline#extensions#ale#error_symbol = '誤:'
let g:airline#extensions#ale#warning_symbol = '危:'

" ================ UltiSnips ========================
let g:UltiSnipsExpandTrigger = '<Tab>'
let g:UltiSnipsJumpForwardTrigger = '<Tab>'
let g:UltiSnipsJumpBackwardTrigger = '<S-Tab>'
let g:UltiSnipsSnippetsDir = '~/dotfiles/vim/ultisnips'
let g:UltiSnipsSnippetDirectories = ['ultisnips']

" ================ Easy Motion ========================
let g:EasyMotion_smartcase = 1
let g:EasyMotion_do_mapping = 0
let g:EasyMotion_keys = 'asdfghjklqwertyuiopzxcvbnm'

" ================ Highlight ========================
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v./

augroup HiglightDebug
    autocmd!
    autocmd WinEnter,VimEnter * :silent! call matchadd('Todo', 'TODO', -1)
    autocmd WinEnter,VimEnter * :silent! call matchadd('Todo', 'DEBUG', -1)
augroup END

augroup FiletypeDetect
    autocmd!
    autocmd BufRead,BufNewFile .stylelintrc setfiletype json
    autocmd BufRead,BufNewFile search-result setfiletype javascript
augroup END

augroup signify
    autocmd!
    autocmd cursormoved * call PoppyInit()
    autocmd FocusGained * :SignifyRefresh
augroup END

let g:poppy_point_enable = 1

" ================ Airline color num ========================
let g:airline_colornum_reversed = 1

" ================ FZF ========================
let g:fzf_buffers_jump = 1
let g:fzf_action = {
            \ 'ctrl-z': 'tab split',
            \ 'ctrl-x': 'split',
            \ 'ctrl-v': 'vsplit'
            \}

" ================ Sparkup ========================
let g:sparkupExecuteMapping = '<C-E>'
let g:sparkupNextMapping = '<C-R>'
let g:sparkupArgs = '--no-last-newline --open-empty-tags'

" ================ Startify ========================
let g:startify_session_autoload = 1

" ================ Sandwich ========================
let g:sandwich#recipes = deepcopy(g:sandwich#default_recipes)
let g:sandwich#recipes += [
            \   {
            \     'buns'        : ['(', ')'],
            \     'motionwise'  : ['line'],
            \     'kind'        : ['add'],
            \     'linewise'    : 1,
            \     'command'     : ["'[+1,']-1normal! >>"],
            \   },
            \   {
            \     'buns'        : ['(', ')'],
            \     'motionwise'  : ['line'],
            \     'kind'        : ['delete'],
            \     'linewise'    : 1,
            \     'command'     : ["'[,']normal! <<"],
            \   },
            \   {
            \     'buns'        : ['{', '}'],
            \     'motionwise'  : ['line'],
            \     'kind'        : ['add'],
            \     'linewise'    : 1,
            \     'command'     : ["'[+1,']-1normal! >>"],
            \   },
            \   {
            \     'buns'        : ['{', '}'],
            \     'motionwise'  : ['line'],
            \     'kind'        : ['delete'],
            \     'linewise'    : 1,
            \     'command'     : ["'[,']normal! <<"],
            \   },
            \   {
            \     'buns'        : ['[', ']'],
            \     'motionwise'  : ['line'],
            \     'kind'        : ['add'],
            \     'linewise'    : 1,
            \     'command'     : ["'[+1,']-1normal! >>"],
            \   },
            \   {
            \     'buns'        : ['[', ']'],
            \     'motionwise'  : ['line'],
            \     'kind'        : ['delete'],
            \     'linewise'    : 1,
            \     'command'     : ["'[,']normal! <<"],
            \   },
            \   {
            \     'external': ['it', 'at'],
            \     'noremap' : 1,
            \     'filetype': ['html'],
            \     'input'   : ['t'],
            \   },
            \ ]

" ================ resize ========================
let g:winresizer_start_key = '<C-T>'

" ================ yank highlight  ========================
let g:highlightedyank_highlight_duration = 100

hi HighlightedyankRegion guibg='#565c64'

autocmd CursorMoved,CursorHold * silent! call HighlightCursorWord()

let g:AutoPairs = {'[':']', '{':'}',"'":"'",'"':'"', '`':'`'}
inoremap <buffer><silent> ) <C-R>=AutoPairsInsert(')')<CR>
inoremap <silent><expr> ( complete_parameter#pre_complete("()")

