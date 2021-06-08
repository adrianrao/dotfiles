"""""""""""""""""""""""""""""""""""""""""""""""""
"              PLUGIN CONFIGURATION             "
"""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin('~/.local/share/nvim/plugged')

" Git Plugins
Plug 'f-person/git-blame.nvim'
Plug 'lewis6991/gitsigns.nvim'

Plug 'gko/vim-coloresque'

" Colors
Plug 'morhetz/gruvbox'
Plug 'maximbaz/lightline-ale'
Plug 'itchyny/lightline.vim'
"Plug 'sainnhe/gruvbox-material'

" tree
Plug 'scrooloose/nerdtree'

" tmux
Plug 'benmills/vimux'
Plug 'christoomey/vim-tmux-navigator'

" git
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'

" IDE
Plug 'yggdroot/indentline'

call plug#end()
