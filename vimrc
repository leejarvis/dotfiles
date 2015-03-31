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
set shortmess+=A                " Disable "ATTENTION" message when a swap file is found
set mouse=a

set wildignore=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#rc()

Plugin 'gmarik/Vundle.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'kchmck/vim-coffee-script'
Plugin 'tomtom/tcomment_vim'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-rails'
Plugin 'vim-ruby/vim-ruby'
Plugin 'slim-template/vim-slim.git'
Plugin 'tpope/vim-haml'
Plugin 'rking/ag.vim'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-fugitive'
Plugin 'fatih/vim-go'
Plugin 'majutsushi/tagbar'
Plugin 'groenewege/vim-less'
Plugin 'godlygeek/tabular'
Plugin 'pangloss/vim-javascript'
" Plugin 'Valloric/YouCompleteMe'
Plugin 'ervandew/supertab'

" CtrlP
let g:ctrlp_match_window_bottom = 0
let g:ctrlp_dont_split = 'nerdtree'
imap <C-p> <esc>:CtrlP<CR>
vmap <C-p> <esc>:CtrlP<CR>

" Use Silver Searcher if possible
if executable("ag")
        set grepprg=ag
        let g:ctrlp_user_command = "ag %s -l --nocolor -g ''"
        let g:ctrlp_use_caching = 0
endif

" Go-vim
let g:go_fmt_fail_silently = 1
let g:syntastic_check_on_open = 1

if has("autocmd")
        filetype plugin indent on

        au BufRead,BufNewFile *.go set ft=go
        au BufRead,BufNewFile *.coffee set ft=coffee
        au BufRead,BufNewFile *.less set ft=less
        au BufRead,BufNewFile *.slim set ft=slim
        au BufRead,BufNewFile *.rs set ft=rust

        au BufWritePre *.go :GoImports
        au BufWritePre * :%s/\s\+$//e

        au FileType ruby,haml,sass,scss,coffee,conf,html,yaml set sw=2 sts=2
        au FileType javascript setlocal sw=4 sts=4
        au FileType make setlocal noexpandtab

        " Enter closing brace in Go/JS
        autocmd FileType go,javascript inoremap <buffer> {<CR>  {<CR>}<Esc>O

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
        set vb t_vb=
endif

let mapleader = ","

map <Leader>b :NERDTreeToggle<CR>
map <Leader>l :b#<CR>
map <Leader>f mzgg=G`z<CR>
map <Leader>w caw
map <Leader>t :TagbarToggle<CR>
map <Leader>rm :call delete(expand('%')) \| bdelete!<CR>
map <Leader>gh :Gbrowse<CR>
map <Leader>gb :Gblame<CR>

" Toggle commenting, current line in normal mode, entire block in visual mode
" relies on tcomment
nmap <Leader>c gcc<CR>
vmap <Leader>c gc<CR>

" Switch tabs like Chrome
noremap <D-A-Right> :tabn<CR>
noremap <D-A-Left>  :tabp<CR>

" CMD+Enter to drop to a new line
inoremap <D-Enter> <Esc>o
nnoremap <D-Enter> o

" Go
au FileType go nmap <Leader>s <Plug>(go-implements)
au FileType go nmap <Leader>i <Plug>(go-info)

function! RenameFile()
    let old_name = expand('%')
    let new_name = input('New file name: ', expand('%'), 'file')
    if new_name != '' && new_name != old_name
        exec ':saveas ' . new_name
        exec ':silent !rm ' . old_name
        redraw!
    endif
endfunction
map <Leader>rn :call RenameFile()<CR>
