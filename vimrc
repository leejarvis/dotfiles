syntax on

set nocompatible 		" Enhance!
set number 			" Enable line numbers
set smarttab 			" The best tab is a smart tab
set ignorecase smartcase 	" Seriously.
set autoindent 			" Naturally
set backupdir=~/.tmp 		" Don't clutter backups
set directory=~/.tmp 		" Don't clutter swaps
set nowrap 			" Dislike word wrapping
set autowrite 			" Auto write buffers when leaving
set autoread 			" Auto read changed files/buffers
set backspace=indent,eol,start 	" Allow backspace in insert mode
set showcmd 			" Show command whilst its being typed
set ruler 		 	" Show cursor at all times
set showmatch
set wildmenu 		 	" Enhance command-line completion
set et 			 	" Expand tabs
set gdefault 		 	" Add g flag to search/replace
set noesckeys
set nofoldenable       	 	" I hate code folding
set clipboard=unnamed  	 	" Use OS clipboard
set ttyfast 		 	" Optimize for fast terminal connections
set cursorline 			" Highlight current line
set hlsearch 			" Highlight searches
set incsearch 			" Whilst we type
set laststatus=2 		" Always show status line
set nostartofline 		" Do not reset cursor
set title 			" Show filename in titlebar
set scrolloff=4 		" Start scrolling 4 lines before border
set splitbelow                  " Open new split pains to bottom
set splitright                  " and right

set rtp+=~/.vim/bundle/vundle
set rtp+=/usr/local/go/misc/vim
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'kien/ctrlp.vim'
Bundle 'terryma/vim-multiple-cursors'
Bundle 'ervandew/supertab'
Bundle 'kchmck/vim-coffee-script'
Bundle 'tomtom/tcomment_vim'
Bundle 'tpope/vim-bundler'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-unimpaired'
Bundle 'vim-ruby/vim-ruby'

let go_highlight_trailing_whitespace_error = 0

" Use Silver Searcher if possible
if executable("ag")
        set grepprg=ag
        let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
        let g:ctrlp_use_caching = 0
endif

if has("autocmd")
        filetype plugin indent on

        au BufRead,BufNewFile *.go setfiletype go
        au BufWritePre * :%s/\s\+$//e

        autocmd FileType ruby,haml,sass set ai sw=2 sts=2 et

        au BufWritePost .vimrc source $MYVIMRC
endif

if has("gui_running")
        set guifont=Bitstream\ Vera\ Sans\ Mono:h15
        set guioptions-=m
        set guioptions-=T
endif

colorscheme desert

let mapleader = ","

map <Leader>bi :!bundle install<cr>

noremap <S-Right> :tabn<CR>
noremap <S-Left>  :tabp<CR>

" CMD+Enter to drop to a new line
inoremap <D-Enter> <Esc>o
nnoremap <D-Enter> o
