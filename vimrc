set nocompatible
set autoindent
set smartindent
set showmatch
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

let mapleader=","

colorscheme railscasts

if has('mouse')
  set mouse=a
endif

if &t_Co > 2
  syntax on
endif

if has("autocmd")
  " Disable flash
  autocmd GUIEnter * set vb t_vb=

  filetype plugin indent on

  autocmd BufNewFile,BufRead *.txt    setf text
  autocmd BufNewFile,BufRead *.haml   setf haml
  autocmd BufNewFile,BufRead *.sass   setf sass
  autocmd BufNewFile,BufRead *.scss   setf scss
  autocmd BufNewFile,BufRead *.coffee setf coffee

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \ exe "normal g`\"" |
    \ endif

  autocmd BufWritePost .vimrc source $MYVIMRC
endif

noremap <C-S> :update<CR>
vnoremap <C-S> <C-C>:update<CR>
inoremap <C-S> <C-O>:update<CR>

noremap <C-T> :FuzzyFinderTextMate<CR>
vnoremap <C-T> <C-C>:FuzzyFinderTextMate<CR>
inoremap <C-T> <C-O>:FuzzyFinderTextMate<CR>

map <C-B> :NERDTreeToggle<CR>
