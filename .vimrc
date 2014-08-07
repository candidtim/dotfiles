" Enable pathogen
execute pathogen#infect()

" NERDTree configuration:
" Open NERDTree if vim called with no arguments
" Close vim if all files closed
" Ctrl-e toggles NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
map <C-e> :NERDTreeToggle<CR>

" AirLine configuration
set laststatus=2
set noshowmode
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_powerline_fonts = 1

" CtrlP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlPMixed'

" General config
syntax enable
set nocompatible
set t_Co=256
set encoding=utf-8
set hidden
set title

" Store backup/swap files in a dedicated directory
set backupdir=~/.vimbackup
set directory=~/.vimswap

" Show 120 characters limit column
set colorcolumn=120
highlight ColorColumn ctermbg=darkgrey guibg=darkgrey

" NERDTree to use dark grey separator with no | inside
highlight VertSplit ctermfg=darkgrey guifg=darkgrey
set fillchars-=vert:\|

" Key mappings
imap <C-Space> <C-n>
imap <C-@> <C-Space>
map <C-n> :enew<CR>
map <C-t> :bnext<CR>
map <C-w> :bp <BAR> bd #<CR>

" Indentation - 2 spaces, automatic
set smartindent
set tabstop=2
set shiftwidth=2
set expandtab

" File associations
au BufNewFile,BufRead *.gradle setf groovy

" Behaviour
" Remove trailing whitespaces on save
autocmd BufWritePre * :%s/\s\+$//e

" Allow local customizations, ignore if not found
silent! so .vimlocal
