call plug#begin('~/.vim/plugged')

Plug 'gmarik/Vundle.vim'
Plug 'kchmck/vim-coffee-script'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-rails'
Plug 'vim-ruby/vim-ruby'
Plug 'slim-template/vim-slim.git'
Plug 'tpope/vim-haml'
Plug 'scrooloose/syntastic'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'fatih/vim-go'
Plug 'majutsushi/tagbar'
Plug 'groenewege/vim-less'
Plug 'godlygeek/tabular'
Plug 'pangloss/vim-javascript'
Plug 'ervandew/supertab'
Plug 'janko-m/vim-test'
Plug 'elixir-lang/vim-elixir'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

call plug#end()

set rtp+=/usr/local/opt/fzf

syntax on

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

set wildmenu
set ruler
set noesckeys
set clipboard=unnamed           " use OS clipboard
set backspace=indent,eol,start 	" allow backspace in insert mode
set showcmd                     " show command whilst its being typed
set ruler                       " show cursor at all times
set nofoldenable       	 	" hate code folding

" FZF
let g:fzf_layout = { 'up': '~20%' }
imap <C-p> <esc>:FZF<CR>
nmap <C-p> :FZF<CR>
vmap <C-p> <esc>:FZF<CR>

" Go-vim
let g:go_fmt_fail_silently = 1
let g:syntastic_check_on_open = 1
let g:go_highlight_trailing_whitespace_error = 0

if has("autocmd")
        filetype plugin indent on

        au BufRead,BufNewFile *.go set ft=go
        au BufRead,BufNewFile *.coffee set ft=coffee
        au BufRead,BufNewFile *.less set ft=less
        au BufRead,BufNewFile *.slim set ft=slim
        au BufRead,BufNewFile *.geojson set ft=json

        au BufWritePre *.go :GoImports

        let notrimtrailingwhitespace = ['sql', 'svg']
        au BufWritePre * if index(notrimtrailingwhitespace, &ft) < 0 | :%s/\s\+$//e

        au FileType ruby,haml,sass,scss,coffee,conf,html,yaml,sh set sw=2 ts=2 sts=2
        au FileType c,cpp set sw=4 ts=4 sts=4
        au FileType javascript setlocal sw=4 sts=4
        au FileType make setlocal noexpandtab

        " don't insert leading # when starting a newline
        au FileType ruby set formatoptions-=or

        " Disable highlighting coffeescript trailing whitespace
        hi link coffeeSpaceError NONE

        " Always start on first line for git messages
        au FileType gitcommit au! BufEnter COMMIT_EDITMSG call setpos('.', [0, 1, 1, 0])

        " Enter closing brace in Go/JS
        au FileType go,javascript inoremap <buffer> {<CR>  {<CR>}<Esc>O

        au BufWritePost .vimrc source $MYVIMRC

        au BufReadPost *
          \ if line("'\"") > 1 && line("'\"") <= line("$") |
          \   exe "normal! g`\"" |
          \ endif
endif

if has("gui_running")
        set guifont=Menlo:h15
        set guioptions-=T
        colorscheme desert
        set vb t_vb=
endif

let mapleader = ","

map <Leader>b :NERDTreeToggle<CR>
map <Leader>l :b#<CR>
map <Leader>f mzgg=G`z<CR>
map <Leader>w caw
map <Leader>rm :call delete(expand('%')) \| bdelete!<CR>
map <Leader>gh :Gbrowse<CR>
map <Leader>gb :Gblame<CR>
map <Leader>a= :Tab /=<CR>
map <Leader>a> :Tab /=><CR>
map <Leader>a, :Tab /,\zs<CR>
map <Leader>a: :Tab /:\zs<CR>

nmap <silent> <leader>t :TestNearest<CR>

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

command! -bar SyntaxGroup :echo 'Normal '.join(map(synstack(line('.'), col('.')), 'synIDattr(v:val, ''name'')'))
