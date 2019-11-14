"   ____                  _           _                         _           
"  / ___| ___  _ __ _ __ (_)_   _ ___( )  _ __   ___  _____   _(_)_ __ ___  
" | |  _ / _ \| '__| '_ \| | | | / __|/  | '_ \ / _ \/ _ \ \ / / | '_ ` _ \ 
" | |_| | (_) | |  | | | | | |_| \__ \   | | | |  __/ (_) \ V /| | | | | | |
"  \____|\___/|_|  |_| |_|_|\__,_|___/   |_| |_|\___|\___/ \_/ |_|_| |_| |_|
"                                                                           
"  _       _ _   
" (_)_ __ (_) |_ 
" | | '_ \| | __|
" | | | | | | |_ 
" |_|_| |_|_|\__|

" Map leader key to ','
let mapleader = ","

" Use system clipboard
set clipboard=unnamedplus

" Use ruler with relative numbers
set number relativenumber

" Ignore case, unless it's capital
set ignorecase
set smartcase

" Display dialog asking what to do
set confirm

" Remap delete commands not to copy things to clipboard
nnoremap D "_D
nnoremap d "_d
nnoremap x "_x

vnoremap d "_d
vnoremap x "_x

" Unless it's with leader key
nnoremap <leader>D "+D
nnoremap <leader>d "+d
nnoremap <leader>x "+x

vnoremap <leader>d "+d
vnoremap <leader>x "+x
