"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" tpope
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-repeat'
" Plug 'tpope/vim-projectionist'

" Shougo
" Plug 'Shougo/vimproc.vim'
" Plug 'Shougo/unite.vim'
Plug 'Shougo/echodoc.vim'
Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }

Plug 'kristijanhusak/defx-git'
Plug 'kristijanhusak/defx-icons'

Plug 'ryanoasis/vim-devicons'

" Git
Plug 'mhinz/vim-signify'
Plug 'airblade/vim-gitgutter'
Plug 'vim-scripts/gitignore'
" Plug 'sodapopcan/vim-twiggy'
Plug 'rhysd/git-messenger.vim'
Plug 'wincent/vcs-jump'
" Plug 'jreybert/vimagit'

" Typescript
Plug 'HerringtonDarkholme/yats.vim'
" Plug 'Quramy/tsuquyomi'

" Go
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

Plug 'mbbill/undotree'

" Javascript
Plug 'othree/yajs.vim'
" Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'chemzqm/vim-jsx-improve'
Plug 'feix760/vim-javascript-gf'
Plug 'moll/vim-node'

" Python
Plug 'Vimjas/vim-python-pep8-indent'
" Plug 'davidhalter/jedi-vim'
Plug 'raimon49/requirements.txt.vim'
Plug 'numirias/semshi'
" Plug 'bps/vim-textobj-python'

" Json
Plug 'elzr/vim-json'
" Plug 'meain/vim-package-info', { 'do': 'npm install' }
" Plug 'mogelbrod/vim-jsonpath'

" HTML5
Plug 'othree/html5.vim'
Plug 'othree/html5-syntax.vim'
" Plug 'lukas-reineke/sparkup'
" Plug 'gregsexton/matchtag'
Plug 'nikvdp/ejs-syntax'

" SCSS
Plug 'cakebaker/scss-syntax.vim'
Plug 'hail2u/vim-css3-syntax'

" Markdown
Plug 'shime/vim-livedown'
Plug 'inkarkat/vim-SyntaxRange'
" Plug 'tamlok/vim-markdown'

" i3 config
Plug 'PotatoesMaster/i3-vim-syntax'

" Nginx
Plug 'chr4/nginx.vim'

" GraphQL
Plug 'jparise/vim-graphql'

" Tmux
Plug 'christoomey/vim-tmux-navigator'
Plug 'tmux-plugins/vim-tmux'
" Plug 'edkolev/tmuxline.vim'
" Plug 'roxma/vim-tmux-clipboard'
Plug 'wellle/tmux-complete.vim'
Plug 'jpalardy/vim-slime'

" Linter
Plug 'w0rp/ale'
Plug 'retorillo/istanbul.vim'
Plug 'shinglyu/vim-codespell'

" Snippets
Plug 'SirVer/ultisnips'
" Plug 'honza/vim-snippets'

" complete parameters
Plug 'lukas-reineke/CompleteParameter.vim'

" Auto pairs
Plug 'lukas-reineke/auto-pairs'

" Text Object
Plug 'michaeljsmith/vim-indent-object'
Plug 'pianohacker/vim-indented-paragraph'
Plug 'kana/vim-textobj-user'
Plug 'sgur/vim-textobj-parameter'
Plug 'wellle/targets.vim'

" Terminus
Plug 'wincent/terminus'

" Auto read
" Plug 'djoshea/vim-autoread'

" Indent Lines
Plug 'Yggdroot/indentLine'
Plug 'lukas-reineke/indent-blankline.nvim'
" Plug 'nathanaelkane/vim-indent-guides'

" inline colors
" Plug 'lilydjwg/colorizer'
" Plug 'amadeus/vim-convert-color-to'

" Airline
Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
Plug 'augustold/vim-airline-colornum'
" Plug 'TaDaa/vimade'

" Easy motion
Plug 'easymotion/vim-easymotion'

" Camel Case Motions
Plug 'bkad/camelcasemotion'

" Replace
Plug 'vim-scripts/ReplaceWithRegister'
Plug 'vim-scripts/ReplaceWithSameIndentRegister'

" Root
Plug 'dbakker/vim-projectroot'

" FZF
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Paste
Plug 'vim-scripts/UnconditionalPaste'
Plug 'sickill/vim-pasta'

" Search
Plug 'haya14busa/incsearch.vim'
" Plug 'eugen0329/vim-esearch'
" Plug 'pelodelfuego/vim-swoop'
" Plug 'fcpg/vim-spotlightify'
Plug 'vim-scripts/CmdlineComplete'
" Plug 'dyng/ctrlsf.vim'
" Plug 'vim-scripts/SearchComplete'
" Plug 'osyo-manga/vim-anzu'
Plug 'mileszs/ack.vim'

" Themes
Plug 'lukas-reineke/onedark.vim'

" Vim Man
Plug 'z1mm32m4n/vim-superman'

" better f
Plug 'rhysd/clever-f.vim'
Plug 'kepbod/quick-scope'

" surrounds
Plug 'machakann/vim-sandwich'

" split and join lines
Plug 'AndrewRadev/splitjoin.vim'
" Plug 'flwyd/vim-conjoin'

" bracket highlighter
Plug 'bounceme/poppy.vim'

" Yank highlight
Plug 'machakann/vim-highlightedyank'

" Better quickfix
Plug 'romainl/vim-qf'
Plug 'romainl/vim-qlist'
Plug 'fszymanski/fzf-quickfix'

" Better visual mode
Plug 'kana/vim-niceblock'

" Marks in column
Plug 'kshenoy/vim-signature'

" local .vimrc
Plug 'krisajenkins/vim-projectlocal'

" close all other buffers
Plug 'schickling/vim-bufonly'

" highlight current word
Plug 'RRethy/vim-illuminate'

" open devdocs.io
" Plug 'rhysd/devdocs.vim'

" alignment
" Plug 'tommcdo/vim-lion'

" " lsp
" Plug 'prabirshrestha/async.vim'
" Plug 'prabirshrestha/vim-lsp'
" " Plug 'ryanolsonx/vim-lsp-typescript'
" Plug 'ryanolsonx/vim-lsp-python'
" Plug 'autozimu/LanguageClient-neovim', {
"     \ 'branch': 'next',
"     \ 'do': 'bash install.sh',
"     \ }
Plug 'neoclide/coc.nvim', {'tag': '*', 'do': { -> coc#util#install()}}

let g:coc_global_extensions = [
\   'coc-browser',
\   'coc-css',
\   'coc-scssmodules',
\   'coc-dictionary',
\   'coc-emmet',
\   'coc-emoji',
\   'coc-github',
\   'coc-highlight',
\   'coc-html',
\   'coc-json',
\   'coc-pyls',
\   'coc-snippets',
\   'coc-tsserver',
\   'coc-ultisnips',
\   'coc-word',
\   'coc-yaml',
\   'coc-vimlsp',
\   'coc-webpack',
\   'coc-go',
\   'coc-docker',
\   'coc-marketplace',
\   'coc-sql',
\   'coc-sh',
\]

Plug 'antoinemadec/coc-fzf'
Plug 'Shougo/neco-vim'
Plug 'neoclide/coc-neco'
Plug 'liuchengxu/vista.vim'

" import cost for js
" Plug 'yardnsm/vim-import-cost', { 'do': 'npm install' }

Plug 'arthurxavierx/vim-caser'

Plug 'vimwiki/vimwiki', { 'branch': 'dev' }
Plug 'tbabej/taskwiki'
Plug 'powerman/vim-plugin-AnsiEsc'
Plug 'mattn/calendar-vim'
