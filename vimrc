" vimrc - Lee Jarvis 

" bad vi!
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
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching
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

" if we're using gvim
if has("gui_running")
  set guioptions-=T   " remove gvim toolbar
  set lines=48
  set columns=112

  " http://github.com/ryanb/dotfiles/blob/master/vim/colors/railscasts.vim
  colorscheme railscasts 

  " Control + S for saving
  noremap <C-S> :update<CR>
  vnoremap <C-S> <C-C>:update<CR>
  inoremap <C-S> <C-O>:update<CR>

  " NERDTree on ^C+b
  noremap <C-b> :NERDTreeToggle<CR>

  " Control+W to close a tab
  map <C-w> :tabclose<CR>
  " Control+T to open a new tab
  map <C-t> :tabnew<CR>

endif " endif gui_running

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" make sure we switch syntax highlighting on if 
" we have colours! yadaboi
if &t_Co > 2
  syntax on
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")
  " Enable file type detection.
  " Also load indent files, to automatically do language-dependent indenting
  filetype plugin indent on

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \ exe "normal g`\"" |
    \ endif
endif
