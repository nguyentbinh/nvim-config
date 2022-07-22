set encoding=utf-8
set fileformat=unix

set showcmd

" wildmenu
set wildmenu
set wildignore+=.git,.hg,.svn,.stversions,*.pyc,*.spl,*.o,*.out,*~,%*
set wildignore+=*.jpg,*.jpeg,*.png,*.gif,*.zip,**/tmp/**,*.DS_Store
set wildignore+=__pycache__,*.egg-info

set noswapfile
set nobackup
set nowrap

" Don't use arrow
let g:elite_mode = 1

set smartindent
set autoindent
set expandtab

" searching
set ignorecase
set smartcase
set incsearch
set showmatch

" live substitution
set inccommand=nosplit

set colorcolumn=120

" set linenumber
augroup numbertoggle
    autocmd!
    autocmd BufEnter,FocusGained * set number relativenumber
    autocmd BufLeave,FocusLost * set nonumber norelativenumber
augroup END

" set cursorline
augroup cursorline
    autocmd!
    autocmd BufEnter,WinEnter * set cursorline
    autocmd BufLeave,WinLeave * set nocursorline
augroup END

" Split to the right
set splitright

" Color settings
if has ('nvim') || has('termguicolors')
    set termguicolors
endif

set background=dark
colorscheme nightfox

" Fuzzy finder
set path+=**
