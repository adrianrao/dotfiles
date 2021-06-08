"""""""""""""""""""""""""""""""""""""""""""""""""
"             KEYBINDS CONFIGURATION            "
"""""""""""""""""""""""""""""""""""""""""""""""""


"nmap ###########################################
" Quick window switching
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

" Make new window
nmap <C-a> :vsplit<CR>
nmap <C-s> :split<CR>

" Open terminal
nmap <S-a> :vsplit term://zsh<CR>
nmap <S-s> :split term://zsh<CR>

" nvim-tree
"nmap <C-n> :NvimTreeToggle<CR>
nmap <C-n> :NERDTreeFind<CR>
nmap <F6> :NvimTreeRefresh<CR>

" nvim-bufferline.lua
"nmap <S-n> :BufferLineCycleNext<CR>

" Telescope
"nmap <F7> :Telescope find_files<CR>


"noremap #########################################

let mapleader=" "

function! OpenTerminal()
  " move to right most buffer
  execute "normal \<C-l>"
  execute "normal \<C-l>"
  execute "normal \<C-l>"
  execute "normal \<C-l>"

  let bufNum = bufnr("%")
  let bufType = getbufvar(bufNum, "&buftype", "not found")

  if bufType == "terminal"
    " close existing terminal
    execute "q"
  else
    " open terminal
    execute "vsp term://zsh"

    " turn off numbers
    execute "set nonu"
    execute "set nornu"

    " toggle insert on enter/exit
    silent au BufLeave <buffer> stopinsert!
    silent au BufWinEnter,WinEnter <buffer> startinsert!

    " set maps inside terminal buffer
    execute "tnoremap <buffer> <C-h> <C-\\><C-n><C-w><C-h>"
    execute "tnoremap <buffer> <C-t> <C-\\><C-n>:q<CR>"
    execute "tnoremap <buffer> <C-\\><C-\\> <C-\\><C-n>"

    startinsert!
  endif
endfunction
nnoremap <C-t> :call OpenTerminal()<CR>

nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>
