"""""""""""""""""""""""""""""""""""""""""""""""""
"             GENERAL CONFIGURATION             "
"
"""""""""""""""""""""""""""""""""""""""""""""""""


" Set encoding
set encoding=utf8

" Set cursor
set guicursor=

" Fix colorscheme
set termguicolors

" Enable mouse support
set mouse=a

" Enable filetype plugins
filetype plugin on
filetype indent on

" Enable ruler
set ruler

" Enable numbering of lines
set number relativenumber

" Enable syntax highlighting
syntax enable

" Enable auto indention
set ai

" Enable smart indention
set si

" Use spaces instead of tabs
set expandtab

" Make tabs smarter
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch 

" Configure backspace so it acts as it should act
set backspace=eol,start,indent

" Turn off backups (cause I hate em)
set nobackup

" Turn off second status bar
set noshowmode

" Change update time for coc.nvim
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c


so ~/dotfiles/cfg/nvim/plugins.vim
so ~/dotfiles/cfg/nvim/conf-plugins.vim
so ~/dotfiles/cfg/nvim/maps.vim
