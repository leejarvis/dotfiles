syntax on

" vundle
set nocompatible
filetype off

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
Plugin 'ervandew/supertab'

" tabs/formatting
set number
set expandtab
set ignorecase smartcase
set autoindent

" searching
set showmatch
set incsearch
set wildignore=log/**,*.log
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif

" backups
set shortmess+=A
set backupdir=~/.tmp
set directory=~/.tmp

" buffers/panes
set autowrite
set autoread
set splitbelow
set splitright

" misc
set nowrap
set wildmenu
set ruler
set noesckeys
set clipboard=unnamed           " use OS clipboard
set backspace=indent,eol,start 	" allow backspace in insert mode
set showcmd                     " show command whilst its being typed
set ruler                       " show cursor at all times
set nofoldenable       	 	" hate code folding

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

        au BufWritePre *.go :GoImports
        au BufWritePre * :%s/\s\+$//e

        au FileType ruby,haml,sass,scss,coffee,conf,html,yaml set sw=2 ts=2 sts=2
        au FileType javascript setlocal sw=4 sts=4
        au FileType make setlocal noexpandtab

        " Enter closing brace in Go/JS
        au FileType go,javascript inoremap <buffer> {<CR>  {<CR>}<Esc>O

        au BufWritePost .vimrc source $MYVIMRC

        au BufReadPost *
          \ if line("'\"") > 1 && line("'\"") <= line("$") |
          \   exe "normal! g`\"" |
          \ endif
endif

if has("gui_running")
        set guifont=Bitstream\ Vera\ Sans\ Mono:h15
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

" tcomment toggle, current line in normal mode, entire block in visual mode
nmap <Leader>c gcc<CR>
vmap <Leader>c gc<CR>

" Switching tabs
noremap <Leader>n :tabn<CR>
noremap <Leader>p :tabn<CR>

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
