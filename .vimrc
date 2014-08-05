" Behave in Windows style
set nocompatible
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

" Set default color scheme
colorscheme desert

" Set default font, encoding and enabled mixed characters display
set guifont=Consolas:h10
set encoding=utf-8
set guifontwide=MingLiU:h10 " specific for windows - to display mixed character sets

" Maximize gvim window on startup
au GUIEnter * simalt ~x " specific for Windows

" Keep all backup files (*~) in separate directory
set backupdir=~/.vimbackup
set directory=~/.vimswap

" Key mappings
map <F6> tabnew
map <F7> tabp
map <F8> tabn
imap <C-Space> <C-n>
imap <C-@> <C-Space>

" Indentation - 4 spaces, automatic
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab
