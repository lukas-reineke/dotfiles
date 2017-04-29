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
set lazyredraw
" set shell=/bin/bash\ --rcfile\ ~/.bash_profile\ -i
set shortmess+=A
set conceallevel=0
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

set encoding=utf8
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
set smartindent
set nofoldenable
" ================ Line Numbers ========================
set number
set relativenumber

" ================ Scrolling ========================
set scrolloff=8
set sidescrolloff=15
set sidescroll=5


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Completion
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" ================ Ignore ========================
set wildmode=list:full
set wildignore=*.o,*.obj,*~
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*cache*
set wildignore+=*logs*
set wildignore+=*node_modules/**
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

" ================ format ========================
set formatprg=par\ -w80rq

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" ================ Nerd Tree ========================
let NERDTreeShowHidden=1
let g:NERDTreeBookmarksFile = '/Users/lukasadmin/dotfiles/vim/nerdtree-bookmarks'
let g:NERDTreeWinSize=50

" ================ CTRLP ========================
let g:ctrlp_show_hidden = 1
let g:NERDTreeChDirMode = 2
let g:ctrlp_working_path_mode = 'rw'
let g:ctrlp_bookmark_cwd = 1
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:30,results:30'

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
let g:syntastic_error_symbol = '誤'
let g:syntastic_warning_symbol = '危'
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_typescript_checkers = ['tsuquyomi', 'tslint']
let g:syntastic_python_checkers = ['pylint']
let g:syntastic_html_tidy_ignore_errors=[" proprietary attribute " ,"trimming empty <", "unescaped &" , "lacks \"action", "is not recognized!", "discarding unexpected"]

" ================ YouCompleteMe ========================
let g:ycm_auto_trigger = 0

" ================ UltiSnips ========================
let g:UltiSnipsExpandTrigger = '<Tab>'
let g:UltiSnipsJumpForwardTrigger = '<Tab>'
let g:UltiSnipsJumpBackwardTrigger = '<S-Tab>'

" ================ Indent Guides ========================
let g:indentLine_char = '┆'

" ================ Easy Motion ========================
let g:EasyMotion_smartcase = 1
let g:EasyMotion_do_mapping = 0 " Disable default mappings
let g:EasyMotion_keys = 'asdfghjklqwertzuiop'

" ================ Highlight ========================
augroup HiglightTODO
    autocmd!
    autocmd WinEnter,VimEnter * :silent! call matchadd('Todo', 'TODO', -1)
    autocmd WinEnter,VimEnter * :silent! call matchadd('Todo', 'DEBUG', -1)
augroup END<Paste>

" ================ textwidth for gitcommit ========================
au FileType gitcommit set tw=72

" ================ Comfortable Motion ========================
let g:comfortable_motion_scroll_down_key = "j"
let g:comfortable_motion_scroll_up_key = "k"

" ================ Y U NO COMMIT ========================
let g:YUNOcommit_after = 20

" ================ Auto Root ========================
function! <SID>AutoProjectRootCD()
  try
    if &ft != 'help'
      ProjectRootCD
    endif
  catch
    " Silently ignore invalid buffers
  endtry
endfunction

autocmd BufEnter * call <SID>AutoProjectRootCD()

" Airline color num
let g:airline_colornum_reversed = 1

