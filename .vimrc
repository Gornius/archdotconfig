"  ____  _    _   _  ____ ___ _   _ ____  
" |  _ \| |  | | | |/ ___|_ _| \ | / ___| 
" | |_) | |  | | | | |  _ | ||  \| \___ \ 
" |  __/| |__| |_| | |_| || || |\  |___) |
" |_|   |_____\___/ \____|___|_| \_|____/ 

call plug#begin('~/.vim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'dylanaraps/wal.vim'
Plug 'xuhdev/vim-latex-live-preview'
Plug 'vim-scripts/sudo.vim'
Plug 'lervag/vimtex'

call plug#end()

"   ___  ____ _____ ___ ___  _   _ ____    _____ ____   ___  __  __ 
"  / _ \|  _ \_   _|_ _/ _ \| \ | / ___|  |  ___|  _ \ / _ \|  \/  |
" | | | | |_) || |  | | | | |  \| \___ \  | |_  | |_) | | | | |\/| |
" | |_| |  __/ | |  | | |_| | |\  |___) | |  _| |  _ <| |_| | |  | |
"  \___/|_|    |_| |___\___/|_| \_|____/  |_|   |_| \_\\___/|_|  |_|
"                                                                   
"  _______  __    _    __  __ ____  _     _____  __     _____ __  __ ____   ____ 
" | ____\ \/ /   / \  |  \/  |  _ \| |   | ____| \ \   / /_ _|  \/  |  _ \ / ___|
" |  _|  \  /   / _ \ | |\/| | |_) | |   |  _|    \ \ / / | || |\/| | |_) | |    
" | |___ /  \  / ___ \| |  | |  __/| |___| |___    \ V /  | || |  | |  _ <| |___ 
" |_____/_/\_\/_/   \_\_|  |_|_|   |_____|_____|    \_/  |___|_|  |_|_| \_\\____|
                                                                               

" Set 'nocompatible' to ward off unexpected things that your distro might
" have made, as well as sanely reset options when re-sourcing .vimrc
set nocompatible

" Attempt to determine the type of a file based on its name and possibly its
" contents. Use this to allow intelligent auto-indenting for each filetype,
" and for plugins that are filetype specific.
filetype indent plugin on

" Enable syntax highlighting
syntax on

" Better command-line completion
set wildmenu
 
" Show partial commands in the last line of the screen
set showcmd

" Highlight searches (use <C-L> to temporarily turn off highlighting; see the
" mapping of <C-L> below)
set hlsearch

" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase

" When opening a new line and no filetype-specific indenting is enabled, keep
" the same indent as the line you're currently on. Useful for READMEs, etc.
set autoindent

" Display the cursor position on the last line of the screen or in the status
" line of a window
set ruler

" Instead of failing a command because of unsaved changes, instead raise a
" dialogue asking if you wish to save changed files.
set confirm

" Set the command window height to 2 lines, to avoid many cases of having to
" press <Enter> to continue"
" set cmdheight=2

" Display line numbers on the left
set number relativenumber

"   ____ _   _ ____ _____ ___  __  __    ___  ____ _____ ___ ___  _   _ ____  
"  / ___| | | / ___|_   _/ _ \|  \/  |  / _ \|  _ \_   _|_ _/ _ \| \ | / ___| 
" | |   | | | \___ \ | || | | | |\/| | | | | | |_) || |  | | | | |  \| \___ \ 
" | |___| |_| |___) || || |_| | |  | | | |_| |  __/ | |  | | |_| | |\  |___) |
"  \____|\___/|____/ |_| \___/|_|  |_|  \___/|_|    |_| |___\___/|_| \_|____/ 

" Use pywal colorscheme
colorscheme wal

" Immediately jump to search
set incsearch

" Set "," as leader
let mapleader = ","

" Use system clipboard
set clipboard=unnamedplus

" Set text margin and auto-wrapping
set textwidth=79
set colorcolumn=80

" Remap delete commands not to copy things to clipboard
nnoremap D "_D
nnoremap d "_d
nnoremap x "_x
nnoremap c "_c
nnoremap C "_C

vnoremap d "_d
vnoremap x "_x
vnoremap c "_c

" Unless it's with leader key
nnoremap <leader>D "+D
nnoremap <leader>d "+d
nnoremap <leader>x "+x
nnoremap <leader>c "+c
nnoremap <leader>C "+C

vnoremap <leader>d "+d
vnoremap <leader>x "+x
vnoremap <leader>c "+c

" LaTeX settings
let g:livepreview_previewer = 'evince'
let g:livepreview_engine = 'pdflatex'
let g:livepreview_cursorhold_recompile = 0