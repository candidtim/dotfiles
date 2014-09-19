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

" Enable file types for NERDCommenter
filetype plugin on

" AirLine configuration
set laststatus=2
set noshowmode
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_powerline_fonts = 1

" CtrlP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlPMixed'
map <C-F12> :CtrlPTag<CR>
map <C-F11> :!ctags -R .<CR>

" Solarized colors
set background=dark
colorscheme solarized

" Syntastic signs
let g:syntastic_error_symbol = '->'
let g:syntastic_warning_symbol = '->'

" General config
syntax enable
set nocompatible
set t_Co=16
set encoding=utf-8
set hidden
set title
set scrolloff=3
set hlsearch

" Folding
set foldmethod=syntax
set foldlevelstart=2

" Use system clipboard as default register
set clipboard=unnamedplus

" Store backup/swap files in a dedicated directory
set backupdir=~/.vimbackup
set directory=~/.vimswap

" Show 120 characters limit column
set colorcolumn=120
highlight ColorColumn ctermbg=black guibg=black

" Key mappings
nnoremap <silent> <Space> :nohlsearch<Bar>:execute 'sign unplace * buffer=' . bufnr('')<Bar>:echo<CR>
imap <C-Space> <C-n>
imap <C-@> <C-Space>
map <C-n> :enew<CR>
map <F6> :bp <BAR> bd #<CR>
map <F7> :bp<CR>
map <F8> :bn<CR>
map <F10> :!make<CR>

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

" Search tags correctly
set tags=tags;/
