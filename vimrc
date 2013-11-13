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
set incsearch 			" Whilst we type
set laststatus=2 		" Always show status line
set nostartofline 		" Do not reset cursor
set title 			" Show filename in titlebar
set scrolloff=4 		" Start scrolling 4 lines before border
set splitbelow                  " Open new split pains to bottom
set splitright                  " and right

set wildignore=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif

set rtp+=~/.vim/bundle/vundle
set rtp+=/usr/local/go/misc/vim
call vundle#rc()

Bundle "gmarik/vundle"
Bundle "kien/ctrlp.vim"
Bundle "terryma/vim-multiple-cursors"
Bundle "ervandew/supertab"
Bundle "kchmck/vim-coffee-script"
Bundle "tomtom/tcomment_vim"
Bundle "tpope/vim-bundler"
Bundle "tpope/vim-endwise"
Bundle "tpope/vim-repeat"
Bundle "tpope/vim-surround"
Bundle "tpope/vim-rails"
Bundle "tpope/vim-unimpaired"
Bundle "vim-ruby/vim-ruby"
Bundle "slim-template/vim-slim.git"
Bundle "tpope/vim-haml"
Bundle "mattn/webapi-vim"
Bundle "mattn/gist-vim"
Bundle "MarcWeber/vim-addon-mw-utils.git"
Bundle "tomtom/tlib_vim"
Bundle "garbas/vim-snipmate"
Bundle "rking/ag.vim"

let go_highlight_trailing_whitespace_error = 0

" Gist
let g:gist_clip_command = 'pbcopy'
let g:gist_post_private = 1

" CtrlP
let g:ctrlp_match_window_bottom = 0

" Use Silver Searcher if possible
if executable("ag")
        set grepprg=ag
        let g:ctrlp_user_command = "ag %s -l --nocolor -g ''"
        let g:ctrlp_use_caching = 0
endif

if has("autocmd")
        filetype plugin indent on

        au BufRead,BufNewFile *.go set ft=go
        au BufRead,BufNewFile *.coffee set ft=coffee

        au BufWritePre *.go :Fmt
        au BufWritePre * :%s/\s\+$//e

        autocmd FileType ruby,haml,sass set sw=2 sts=2

        au BufWritePost .vimrc source $MYVIMRC

        autocmd BufReadPost *
          \ if line("'\"") > 1 && line("'\"") <= line("$") |
          \   exe "normal! g`\"" |
          \ endif
endif

if has("gui_running")
        set guifont=Bitstream\ Vera\ Sans\ Mono:h15
        set guioptions-=m
        set guioptions-=T
        colorscheme desert
endif

let mapleader = ","

map <Leader>bi :!bundle install<cr>

noremap <D-A-Right> :tabn<CR>
noremap <D-A-Left>  :tabp<CR>

" CMD+Enter to drop to a new line
inoremap <D-Enter> <Esc>o
nnoremap <D-Enter> o
