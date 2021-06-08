"""""""""""""""""""""""""""""""""""""""""""""""""
"             HIGHLIGHT CONFIGURATION           "
"""""""""""""""""""""""""""""""""""""""""""""""""

" colorscheme
highlight LineNr guibg=#1d2021

" coc.nvim
highlight CocErrorSign guifg=#EA6962
highlight CocWarningSign guifg=#FFC745

" floaterm
highlight FloatermBorder guibg=#1d2021

" bufferline
highlight BufferLineFill guibg=NONE

" nvim-tree
highlight NvimTreeFileDirty guifg=#EA6962
highlight NvimTreeGitDirty guifg=#EA6962
highlight NvimTreeRootFolder guifg=#7DAEA3

highlight StatusLineNC gui=underline guibg=NONE guifg=#282828

" Set colorscheme
"let g:gruvbox_material_background = "hard"
let g:gruvbox_contrast_dark = "hard"
colorscheme gruvbox

" Set NvimTree
let g:nvim_tree_indent_markers = 1
let g:nvim_tree_quit_on_open = 1
let g:nvim_tree_auto_open = 1
let g:nvim_tree_git_hl = 1
let g:nvim_tree_ignore = [ ".cache", ".git", "node_modules", "data" ]

" kite
" All the languages Kite supports
let g:kite_supported_languages = ['bash','javascript','python']

" tab complete
let g:kite_tab_complete=1

" always display the status line
set laststatus=2  

" Lightlane
let g:lightline = {
      \ 'active': {
      \   'left': [['mode', 'paste'], [], ['relativepath', 'modified']],
      \   'right': [['kitestatus'], ['filetype', 'percent', 'lineinfo'], ['gitbranch']]
      \ },
      \ 'inactive': {
      \   'left': [['inactive'], ['relativepath']],
      \   'right': [['bufnum']]
      \ },
      \ 'component': {
      \   'bufnum': '%n',
      \   'inactive': 'inactive'
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head',
      \   'kitestatus': 'kite#statusline'
      \ },
      \ 'colorscheme': 'gruvbox',
      \ 'subseparator': {
      \   'left': '',
      \   'right': ''
      \ }
      \}

" vim fugitive
command! -bang -nargs=? -complete=dir GFiles
  \ call fzf#vim#gitfiles(<q-args>, fzf#vim#with_preview(), <bang>0)

command! -bang -nargs=* Ag
  \ call fzf#vim#ag(<q-args>, fzf#vim#with_preview(), <bang>0)

command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)
