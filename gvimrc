set guifont=BitstreamVeraSansMono-Roman:h13
set guioptions-=T
set lines=60
set columns=110

if has("gui_macvim")
  macmenu &File.New\ Tab key=<nop>
  map <D-t> :CommandT<CR>
endif
