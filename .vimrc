" Enable pathogen
execute pathogen#infect()

" Remap Leader
let mapleader = ","

" Plug-ins configuration

" NERDTree
let g:NERDTreeWinPos = "right" " NERDTree on the right side
map <C-e> :NERDTreeToggle<CR> " Ctrl-e toggles NERDTree
" Open NERDTree if vim called with no arguments
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" Close vim if all files closed
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

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

" Ag for ack.vim
let g:ackprg = 'ag --nogroup --nocolor --column'

" Solarized colors
set background=dark
set t_Co=16
colorscheme solarized

" Syntastic signs
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_wq = 0 " do not run syntastic when writing before quit (yet run on normal writes)
let g:syntastic_error_symbol = '=>'
let g:syntastic_warning_symbol = '->'

" vim-slime
let g:slime_target = "tmux"

" Easy Motion - use ,w ,j ,k etc.
map <Leader> <Plug>(easymotion-prefix)


" General config
syntax enable
set cursorline     " highlight the line the cursor is on
set nocompatible   " don't care about Vi compatibility
set encoding=utf-8      " utf-8 everywhere by default
set printencoding=utf-8 " utf-8 everywhere by default
set hidden
set title          " set title in terminal emulator
set scrolloff=3
set mouse=a        " enable mouse
set clipboard^=unnamed,unnamedplus
" .. search
set hlsearch       " highlight search results
set ignorecase     " case-insensitive search, see next one
set smartcase      " consider case if search starts with Uppercase
set incsearch

" Store backup/swap files in a dedicated directory
set backupdir=~/.vimbackup
set directory=~/.vimswap

" Show 120 characters limit column
set colorcolumn=120
highlight ColorColumn ctermbg=grey guibg=grey

" Key mappings
" .. usability
nnoremap <silent> <Space> :nohlsearch<Bar>:execute 'sign unplace * buffer=' . bufnr('')<Bar>:echo<CR>
imap <C-Space> <C-n> " Ctrl-Space to navigate autocomplete proposed values
imap <C-@> <C-Space> " enable Ctrl-Space for real
map <F1> <Esc>       " both keys are so close, treat F1 as ESC in case F1 is hit by accident
imap <F1> <Esc>      " both keys are so close, treat F1 as ESC in case F1 is hit by accident
" .. buffers
map <F6> :bp <BAR> bd #<CR> " delete current buffer
map <F7> :bp<CR>            " switch to previous buffer
map <F8> :bn<CR>            " switch to next buffer
imap <F7> <Esc> :bp<CR>     " switch to previous buffer from Insert mode
imap <F8> <Esc> :bn<CR>     " switch to next buffer from Insert mode
autocmd FileType nerdtree noremap <buffer> <F7> <nop> " disbale buffer switch (above) in NERDTree
autocmd FileType nerdtree noremap <buffer> <F8> <nop> " disbale buffer switch (above) in NERDTree
" .. external tools
map <F9> yiw:Ack <C-R>"<CR> " search usages of the word under cursor with Ack
map <F10> :NERDTreeFind<CR> " show "current" file in NERDTree
map <F12> :CtrlPTag<CR>     " lookup all tags
map <F11> :!ctags -R .<CR>  " generate tags

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
silent! so ~/.vimlocal

" Load abbreviations
so ~/.vimabbr

" Search tags correctly
set tags=tags;/
