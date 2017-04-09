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


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set rtp+=~/.vimpkg/bundle/Vundle.vim
call vundle#begin('~/.vimpkg/bundle')

so $HOME/dotfiles/vim/plugin-list.vim

call vundle#end()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

so $HOME/dotfiles/vim/functions.vim


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Global Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

syntax on
set nocompatible
filetype plugin indent on
set termguicolors
color dracula

" Wrapping
set nowrap
set whichwrap=b
set whichwrap+=h
set whichwrap+=l

" ================ Chars ========================
set list
set listchars=eol:⬎
set listchars+=tab:>-
set listchars+=trail:.
set listchars+=extends:>
set listchars+=precedes:<
set listchars+=nbsp:_
set listchars+=space:٠

set encoding=utf-8
set t_ut=
set ttimeoutlen=0
set timeoutlen=500
set mouse=
set clipboard+=unnamedplus
set splitbelow
set splitright
set autoread
" Highlight cursorline
set cursorline
" Allow hidden buffers
set hidden
set virtualedit=block
" Ignore case when searching
set ignorecase
" When searching try to be smart about cases
set smartcase
" Highlight search results
set hlsearch
" Makes search act like search in modern browsers
set incsearch
" ================ Tabs ========================
set expandtab
set smarttab
set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab
set smartindent
set nofoldenable
" ================ Line Numbers ========================
set number
set relativenumber

" ================ Scrolling ========================
set scrolloff=8
set sidescrolloff=15
set sidescroll=5



""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""
hi StatusLine   ctermfg=15  guifg=#ffffff ctermbg=239 guibg=#4e4e4e cterm=bold gui=bold
hi StatusLineNC ctermfg=249 guifg=#b2b2b2 ctermbg=237 guibg=#3a3a3a cterm=none gui=none
" Always show the status line
set laststatus=2

set statusline+=%f
set statusline+=\ %{fugitive#statusline()}
set statusline+=%=
set statusline+=%m
set statusline+=\ %y
set statusline+=\ %04l

" Linter
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Completion
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set wildmode=list:full
set wildignore=*.o,*.obj,*~
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*cache*
set wildignore+=*logs*
set wildignore+=*node_modules/**
set wildignore+=*DS_Store*
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=*/tmp/**
set wildignore+=*.png,*.jpg,*.gif
set wildignore+=*.so
set wildignore+=*.swp
set wildignore+=*.zip
set wildignore+=*/platforms/*
set wildignore+=*venv*


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" ================ Nerd Tree ========================
let NERDTreeShowHidden=1
let g:NERDTreeBookmarksFile = '/Users/lukasadmin/dotfiles/vim/nerdtree-bookmarks'

" ================ CTRLP ========================
let g:ctrlp_show_hidden = 1
let g:NERDTreeChDirMode = 2
let g:ctrlp_working_path_mode = 'rw'

" ================ Tmux Integration ========================
let g:tmux_navigator_disable_when_zoomed = 1

" ================ Comments ========================
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1

" ================ Syntastic ========================
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_error_symbol = "!!"
let g:syntastic_warning_symbol = ">>"
let g:syntastic_javascript_checkers = ['eslint']

" ================ UltiSnips ========================
let g:UltiSnipsExpandTrigger = '<Tab>'
let g:UltiSnipsJumpForwardTrigger = '<Tab>'
let g:UltiSnipsJumpBackwardTrigger = '<S-Tab>'

" ================ Indent Guides ========================
let g:indentLine_char = '┆'
