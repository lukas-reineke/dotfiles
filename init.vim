set nocompatible              " be iMproved, required
filetype off                  " required

let mapleader = ","
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" No line wrap
set nowrap

set listchars=eol:⇁,tab:>-,trail:.,extends:>,precedes:<,nbsp:_,space:٠
set list
" UTF 8
set encoding=utf-8
set t_ut=
set ttimeoutlen=200
set timeoutlen=200
set mouse=
set clipboard+=unnamedplus

vnoremap <S-tab> <gv
vnoremap <tab> >gv

" imap <C-tab> <C-n>
function! Smart_TabComplete()
  let line = getline('.')                         " current line

  let substr = strpart(line, -1, col('.')+1)      " from the start of the current
                                                  " line to one character right
                                                  " of the cursor
  let substr = matchstr(substr, "[^ \t]*$")       " word till cursor
  if (strlen(substr)==0)                          " nothing to match on empty string
    return "\<tab>"
  endif
  let has_period = match(substr, '\.') != -1      " position of period, if any
  let has_slash = match(substr, '\/') != -1       " position of slash, if any
  if (!has_period && !has_slash)
    return "\<C-X>\<C-P>"                         " existing text matching
  elseif ( has_slash )
    return "\<C-X>\<C-F>"                         " file matching
  else
    return "\<C-X>\<C-O>"                         " plugin matching
  endif
endfunction

inoremap <tab> <c-r>=Smart_TabComplete()<CR>

" set cb=unnamedplus

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Nerd Tree
Plugin 'scrooloose/nerdtree'
" Nerd Tree Git
Plugin 'Xuyuanp/nerdtree-git-plugin'
" Surround
Plugin 'tpope/vim-surround'
" Nerd Commenter
" Plugin 'scrooloose/nerdcommenter'
" Commentary
Plugin 'tpope/vim-commentary'
" Dracula Theme
Plugin 'dracula/vim'
" Typescript Syntax
Plugin 'leafgarland/typescript-vim'
" Indent helper
" Plugin 'nathanaelkane/vim-indent-guides'
" Control P
Plugin 'kien/ctrlp.vim'
" Tmux Navigator
Plugin 'christoomey/vim-tmux-navigator'
" Git Gutter
Plugin 'airblade/vim-gitgutter'
" Linter
Plugin 'vim-syntastic/syntastic'
" Tsuquyami
Plugin 'Quramy/tsuquyomi'
" Vimproc
Plugin 'Shougo/vimproc.vim'
" Smoth Scroll
Plugin 'terryma/vim-smooth-scroll'
" Vim Javascript
Plugin 'pangloss/vim-javascript'
" Auto pairs
Plugin 'jiangmiao/auto-pairs'
" Indent Text Object
Plugin 'michaeljsmith/vim-indent-object'
" Inner Line Text Object
Plugin 'vim-utils/vim-line'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
" filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


" use syntax
syntax on

" color
" colorscheme sierra
set termguicolors
color dracula
"let g:sierra_Pitch = 1
"hi Normal ctermbg=none
"highlight NonText ctermbg=none

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

set number
set relativenumber

" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif

""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2

" Format the status line
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    en
    return ''
endfunction

map <silent> <C-b> :NERDTreeToggle <CR>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>


" ================ Shortcuts ==================
map H ^
map HH 0
map L $
map K 5k
map J 5j
" ================ Persistent Undo ==================

" Keep undo history across sessions, by storing in file.
silent !mkdir ~/.config/nvim/backups > /dev/null 2>&1
set undodir=~/.config/nvim/backups
set undofile

" ================ Indentation ======================

set shiftwidth=4
set softtabstop=4
set tabstop=4
set expandtab
set smartindent
set nofoldenable


" ================ Auto commands ======================

augroup vimrc
    autocmd!
augroup END

autocmd vimrc BufWritePre * :call s:StripTrailingWhitespaces()                  "Auto-remove trailing spaces


" ================ Completion =======================

set wildmode=list:full
set wildignore=*.o,*.obj,*~                                                     "stuff to ignore when tab completing
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*cache*
set wildignore+=*logs*
set wildignore+=*node_modules/**
set wildignore+=*DS_Store*
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif


" ================ Scrolling ========================

set scrolloff=8                                                                 "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=5


" ================ Functions ========================

function! s:StripTrailingWhitespaces()
    let l:l = line(".")
    let l:c = col(".")
    %s/\s\+$//e
    call cursor(l:l, l:c)
endfunction


" Move selected lines up and down
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" ================ Plugins ========================
let NERDTreeShowHidden=1

let g:ctrlp_show_hidden = 1
let g:NERDTreeChDirMode = 2
let g:ctrlp_working_path_mode = 'rw'

" CTRL P
" let g:CtrlPBuffer = '<c-o>'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/platforms/*
nmap <C-p> :CtrlPMixed

" Disable tmux navigator when zooming the Vim pane
let g:tmux_navigator_disable_when_zoomed = 1

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Linter
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['eslint']

" Smoth Scroll
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 1, 5)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 1, 5)<CR>
