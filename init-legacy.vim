" keymaps
" enter normal mode
imap jj <Esc>
imap JJ <Esc>
" save file
imap jk <Esc>:w<CR>
imap JK <Esc>:w<CR>

" navigation made easy
imap kk <C-o>a
imap KK <Esc>A

" hide highlight
nnoremap <Esc> :noh<CR><Esc>

" options
set ignorecase
set smartcase
set noswapfile
set clipboard=unnamedplus
