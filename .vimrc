" Enable pathogen
execute pathogen#infect()


" NERDTree configuration
" Open NERDTree if vim called with no arguments
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" Close vim if all files closed
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
" Ctrl-e toggles NERDTree
map <C-e> :NERDTreeToggle<CR>


" AirLine configuration
set laststatus=2
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_powerline_fonts = 1


" CtrlP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlPMixed'

syntax enable
set nocompatible
set t_Co=256
set encoding=utf-8
set noshowmode
set hidden
set colorcolumn=120
highlight ColorColumn ctermbg=darkgrey guibg=darkgrey
highlight VertSplit ctermfg=darkgrey guifg=darkgrey
set fillchars-=vert:\|
set backupdir=~/.vimbackup
set directory=~/.vimswap

" Key mappings
imap <C-Space> <C-n>
imap <C-@> <C-Space>
map <C-n> :enew<CR>
map <C-t> :bnext<CR>
map <C-w> :bp <BAR> bd #<CR>

" Indentation - 4 spaces, automatic
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab

