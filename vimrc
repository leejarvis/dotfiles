" vimrc 

set nocompatible

" continuous indentation
set autoindent
set smartindent

" match corresponding brace/parenthesis
set showmatch

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

set nobackup            " dont keep backup files
set noswapfile          " ugh
set history=300         " history buffer
set ruler		            " show the cursor position all the time
set showcmd		          " display incomplete commands
set incsearch		        " do incremental searching
set shiftwidth=2        " 2 is enough
set tabstop=2
set smarttab            " <3 smart tabbing
set expandtab           " correct spaces
set autoread            " auto read file when it's changed/updated
set title               " allow vim to change the title
set number              " we like line numbers
set nohlsearch          " dont hilight search words
set ignorecase          " ignore case when searching
tab all
set noerrorbells
set visualbell
set t_vb=

let mapleader=","

" if we're using gvim
if has("gui_running")
  set guioptions-=T
  set lines=48
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

  " Enable file type detection.
  " Also load indent files, to automatically do language-dependent indenting
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

" ^C+s for saving
noremap <C-S> :update<CR>
vnoremap <C-S> <C-C>:update<CR>
inoremap <C-S> <C-O>:update<CR>

map <C-b> :NERDTreeToggle<CR>

nmap <F1> <Esc>
imap <Tab> <C-N>
