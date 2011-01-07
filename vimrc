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

" if we're using gvim
if has("gui_running")
  set guioptions-=T
  set lines=44
  set columns=120
  colorscheme railscasts
endif

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

if &t_Co > 2
  syntax on
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")
  " Disable flash
  autocmd GUIEnter * set vb t_vb=

  filetype plugin indent on

  " Set File type to 'text' for files ending in .txt
  autocmd BufNewFile,BufRead *.txt setfiletype text

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \ exe "normal g`\"" |
    \ endif

  autocmd BufWritePost .vimrc source $MYVIMRC
endif

" Saving
noremap <C-S> :update<CR>
vnoremap <C-S> <C-C>:update<CR>
inoremap <C-S> <C-O>:update<CR>

noremap <C-T> :FuzzyFinderTextMate<CR>
vnoremap <C-T> <C-C>:FuzzyFinderTextMate<CR>
inoremap <C-T> <C-O>:FuzzyFinderTextMate<CR>

map <C-B> :NERDTreeToggle<CR>
