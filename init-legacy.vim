" Enter normal mode
imap jj <Esc>
imap JJ <Esc>

" Save file
imap jk <Esc>:w<CR>
imap JK <Esc>:w<CR>

" Navigation made easy
imap kk <C-o>a
imap KK <Esc>A

" Hide highlight
nnoremap <Esc> :noh<CR><Esc>

" Select all
nnoremap <C-a> ggVG

" Move block of code up using Alt+Up
nnoremap <A-k> :m .-2<CR>==

" Move block of code down using Alt+Down
nnoremap <A-j> :m .+1<CR>==

" Move selected block of code up using Alt+Up
vnoremap <A-k> :m '<-2<CR>gv=gv

" Move selected block of code down using Alt+Down
vnoremap <A-j> :m '>+1<CR>gv=gv

" Options
set ignorecase
set smartcase
set noswapfile
set clipboard=unnamedplus
set relativenumber
set tabstop=2
set shiftwidth=2
set expandtab
