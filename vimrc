silent! call pathogen#runtime_append_all_bundles()

set nocompatible
set autoindent
set smartindent
set backspace=indent,eol,start
set nobackup
set noswapfile
set history=300
set ruler
set showcmd
set incsearch
set shiftwidth=2
set tabstop=2
set linespace=2
set smarttab
set expandtab
set autoread
set autowrite
set title
set number
set nohlsearch
set ignorecase
tab all
set noerrorbells
set visualbell
set t_vb=
set cursorline
set nowrap
set shell=/bin/sh
let mapleader=','

if has("gui_running")
  set background=dark
  colorscheme solarized
else
  set background=dark
endif

let g:gist_detect_filetype = 1
let g:gist_clip_command = 'pbcopy'

if has('mouse')
  set mouse=a
endif

if &t_Co > 2
  syntax on
endif

if has("autocmd")
  filetype plugin indent on

  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \ exe "normal g`\"" |
    \ endif

  autocmd BufWritePre * :%s/\s\+$//e
  autocmd BufWritePost vimrc source $MYVIMRC
  " autocmd BufEnter * lcd %:p:h
endif

" language specific mkprgs
au FileType ruby setl mp=ruby\ %

" map cmd+r to make
inoremap <D-r> <Esc>:make<CR>
nnoremap <D-r> :make<CR>

" Navigation mappings
inoremap <D-Enter> <Esc>o
nnoremap <D-Enter> o

" NERDTree
map <C-b> :NERDTreeToggle<CR>
imap <C-b> <Esc>:NERDTreeToggle<CR>
