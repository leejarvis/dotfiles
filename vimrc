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

colorscheme vague

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

  autocmd BufWritePost .vimrc source $MYVIMRC
endif

" language specific mkprgs
au FileType ruby   setl mp=ruby\ %
au FileType lua    setl mp=lua\ %
au FileType python setl mp=python\ %

" map cmd+r to make
inoremap <D-r> <Esc>:make<CR>
nnoremap <D-r> <Esc>:make<CR>

" Navigation mappings
inoremap <D-Enter> <Esc>o
nnoremap <D-Enter> o

" NERDTree
map <C-b> :NERDTreeToggle<CR>
imap <C-b> <Esc>:NERDTreeToggle<CR>
