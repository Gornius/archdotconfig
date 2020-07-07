" Plugins section : {{{
" vim: fdm=marker
"  ____  _    _   _  ____ ___ _   _ ____  
" |  _ \| |  | | | |/ ___|_ _| \ | / ___| 
" | |_) | |  | | | | |  _ | ||  \| \___ \ 
" |  __/| |__| |_| | |_| || || |\  |___) |
" |_|   |_____\___/ \____|___|_| \_|____/ 

call plug#begin('~/.vim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'morhetz/gruvbox'
Plug 'vim-scripts/sudo.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

" }}}
" Paste from example vimrc {{{
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

" }}}
" My custom options: {{{
"   ____ _   _ ____ _____ ___  __  __    ___  ____ _____ ___ ___  _   _ ____  
"  / ___| | | / ___|_   _/ _ \|  \/  |  / _ \|  _ \_   _|_ _/ _ \| \ | / ___| 
" | |   | | | \___ \ | || | | | |\/| | | | | | |_) || |  | | | | |  \| \___ \ 
" | |___| |_| |___) || || |_| | |  | | | |_| |  __/ | |  | | |_| | |\  |___) |
"  \____|\___/|____/ |_| \___/|_|  |_|  \___/|_|    |_| |___\___/|_| \_|____/ 
"

" Powerline Airline {{{
    if !exists('g:airline_symbols')
        let g:airline_symbols = {}
    endif

    " unicode symbols
    let g:airline_left_sep = '»'
    let g:airline_left_sep = '▶'
    let g:airline_right_sep = '«'
    let g:airline_right_sep = '◀'
    let g:airline_symbols.crypt = '🔒'
    let g:airline_symbols.linenr = '☰'
    let g:airline_symbols.linenr = '␊'
    let g:airline_symbols.linenr = '␤'
    let g:airline_symbols.linenr = '¶'
    let g:airline_symbols.maxlinenr = ''
    let g:airline_symbols.maxlinenr = '㏑'
    let g:airline_symbols.branch = '⎇'
    let g:airline_symbols.paste = 'ρ'
    let g:airline_symbols.paste = 'Þ'
    let g:airline_symbols.paste = '∥'
    let g:airline_symbols.spell = 'Ꞩ'
    let g:airline_symbols.notexists = 'Ɇ'
    let g:airline_symbols.whitespace = 'Ξ'

    " powerline symbols
    let g:airline_left_sep = ''
    let g:airline_left_alt_sep = ''
    let g:airline_right_sep = ''
    let g:airline_right_alt_sep = ''
    let g:airline_symbols.branch = ''
    let g:airline_symbols.readonly = ''
    let g:airline_symbols.linenr = '☰'
    let g:airline_symbols.maxlinenr = ''
"  }}}
" QuickRun {{{
au BufEnter *.cpp set makeprg=g++\ -g\ %\ -o\ %< 
au BufEnter *.c set makeprg=gcc\ -g\ %\ -o\ %< 
au BufEnter *.py set makeprg=python\ % 
au BufEnter *.[rR] set makeprg=Rscript\ %
map <F5> :call CompileGcc()<CR>
func! CompileGcc()
    exec "w" 
    silent make
endfunc
" }}}

" Tab size = 4
set tabstop=4
set shiftwidth=4
set expandtab

" Better colors
" set termguicolors

" set Vim-specific sequences for RGB colors
set termguicolors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

" Use colorscheme
colorscheme gruvbox
set bg=dark

" Transparent background
hi Normal guibg=NONE ctermbg=NONE

" Immediately jump to search
set incsearch

" Set "," as leader
let mapleader = ","

" Use system clipboard
set clipboard=unnamedplus

" Set text margin and auto-wrapping
set textwidth=79
set colorcolumn=80

" Format options for autowrapping not used due to messing with lines :/
" set fo+=aw


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

" Jump to last position in opent file
autocmd BufReadPost *
  \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
  \ |   exe "normal! g`\""
  \ | endif
" }}}
" coc.nvim {{{
" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=1000

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Use <tab> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <S-TAB> <Plug>(coc-range-select-backword)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
" }}}
