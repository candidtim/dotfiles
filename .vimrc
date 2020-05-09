" TODO:
" - integrate movements with tmux

" General config
"
let mapleader = " "     " remap leader to Spacebar
syntax enable
let python_highlight_all=1
filetype plugin indent on
set nocompatible        " don't care about Vi compatibility
set cursorline          " highlight the line the cursor is on
set encoding=utf-8      " utf-8 everywhere by default
set printencoding=utf-8 " utf-8 everywhere by default
set hidden
set title               " set title in terminal emulator
set scrolloff=3         " make some context visible
set mouse=a             " enable mouse
set wrap                " don't wrap long lines
set showmatch           " show matching brackets
set matchtime=5         " showmatch briefly
set timeoutlen=250      " Esc faster
set notimeout           " Leader doesn't time out
set autowrite           " autowrite files on change buffer, etc.
set autoread            " autoread files when changed outside
set clipboard^=unnamed,unnamedplus " copy to the system clipboard
set backspace=indent,eol,start     " backspace by indent, over lines, start of insert
" .. line numbers
set number              " show line numbers
set relativenumber      " or actually relative numbers on all lines except current
" .. search
set hlsearch            " highlight search results
set ignorecase          " case-insensitive search, see next one
set smartcase           " consider case if search starts with Uppercase
set incsearch           " show mathes while typing
" .. identation
set smartindent
set autoindent          " copy indent from previous line
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab           " use TAB to insert spaces
set formatoptions+=j    " sane line joins
" .. disable bell
set t_vb=
" .. show 80 chars limit column
set colorcolumn=80
highlight ColorColumn ctermbg=grey guibg=grey
" .. backup
set backupdir=~/.vimbackup
set directory=~/.vimswap
" .. ctags
set tags=./tags;$HOME   " search tags correctly in local dir and up to home
" .. don't show ~ after end of buffer
autocmd VimEnter * :highlight NonText ctermfg=black guifg=bg
" .. save undo-s longer
set undofile
set undodir=$HOME/.vim/undo
set undolevels=1000
set undoreload=10000
" .. nicer splits in the terminal Vim
set fillchars=vert:\│

"
" Autosave
"
autocmd BufWritePre * :%s/\s\+$//e " remove trailing whitespaces on save
autocmd BufLeave,FocusLost * silent! wall " autosave when switching buffers

"
" Code formatting
"
autocmd BufWritePost *.js !npm run prettier -- --write %
autocmd BufWritePost *.py !black %

"
" Custom commands
"
comm! W exec 'w !sudo tee % > /dev/null' | e!  " W to write with sudo

"
" Key mappings
"

" menu with ;
nnoremap ; :

" up and down on wrapped lines
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

" save, open, tags, switch buffers, etc.:
nnoremap <Leader>fs :w<CR>
nnoremap <Leader>ff :Files<CR>
nnoremap <Leader>fp :GFiles<CR>
nnoremap <Leader>fh :History<CR>
nnoremap <Leader>bb :Buffers<CR>
nnoremap <Leader>bd :bd<CR>
nnoremap <Leader>tt :Tags<CR>
nnoremap <Leader>tg :!ctags -R .<CR>
nnoremap <Leader>q :quit<CR>
" remove search highlight:
nnoremap <silent> <Leader>/ :nohlsearch<CR>

" navigate visible buffers:
nnoremap H :bp<CR>
nnoremap L :bn<CR>

" use `Shift-F6` to rename current higlight globally
nnoremap <expr> <S-F6> ':%s/' . @/ . '//gc<LEFT><LEFT><LEFT>'

" temp macros: start with qq, stop with q, repeat with Q
nnoremap Q @q

" make 0 jump between ^ and 0
noremap <expr> <silent> 0 col('.') == match(getline('.'),'\S')+1 ? '0' : '^'

" lnext / lprev
map ]q :lnext<CR>
map [q :lprev<CR>

" spell check
nnoremap <Leader>se :set spell spelllang=en_us<CR>
nnoremap <Leader>su :set spell spelllang=en_us<CR>
nnoremap <Leader>sf :set spell spelllang=fr_fr<CR>
nnoremap <Leader>so :set nospell<CR>


"
" Plugins
"
" .. enable Vundle
filetype off " required for Vundle, ractivated afterwards
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" .. vundle manages itself too
Plugin 'VundleVim/Vundle.vim'

" NERDTree
Plugin 'scrooloose/nerdtree'
let g:NERDTreeWinPos = "right" " NERDTree on the right side
" close vim if all buffers are closed, but the NERDTree
au bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" .. mappings:
" .. Ctrl-e toggles NERDTree
map <C-e> :NERDTreeToggle<CR>
" .. F10 to find current file in NERDTree
map <F10> :NERDTreeFind<CR>

" AirLine
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
set laststatus=2
set noshowmode
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_powerline_fonts = 1

Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
set rtp+=~/.fzf
set wildignore+=*/node_modules/*,*/build/*,*/.git/*,*/*.egg-info/*,*/dist/*,*.class,*.pyc

" Solarized Theme (for vim in terminal)
Plugin 'altercation/vim-colors-solarized'
set background=dark
set t_Co=16
let g:solarized_termtrans = 1
" cannot activate the colorscheme here becuase bundle is not yet available
" https://github.com/VundleVim/Vundle.vim/issues/119
" activated after Vundle.end

" Codeschool Theme (for gvim)
Plugin 'antlypls/vim-colors-codeschool'

Plugin 'w0rp/ale'
let g:airline#extensions#ale#enabled = 1
let g:ale_lint_on_enter = 0
let g:ale_sign_error = '>'
let g:ale_sign_warning = '>'

" Ack (used with ag)
Plugin 'mileszs/ack.vim'
let g:ackprg = 'ag --vimgrep'
let g:ackhighlight = 1
" .. mappings:
map <F4> :Ack "TODO\|FIXME"<CR>
nnoremap <Leader>a :Ack!<Space>
map <F7> :Ack! "\b<cword>\b" <CR>

" Easy motion
Plugin 'easymotion/vim-easymotion'
map <Leader><Leader> <Plug>(easymotion-prefix)
hi link EasyMotionShade Comment

" Polyglot (languages support)
Plugin 'sheerun/vim-polyglot'

" Vim Slime
Plugin 'jpalardy/vim-slime'
let g:slime_target = "tmux"

" Vim Surround
Plugin 'tpope/vim-surround'

" gitgutter
Plugin 'airblade/vim-gitgutter'
nnoremap <C-n> :GitGutterNextHunk<CR>
nnoremap <M-n> :GitGutterPrevHunk<CR>
nnoremap <C-u> :GitGutterUndoHunk<CR>

" Vim Wiki
Plugin 'vimwiki/vimwiki'
let g:vimwiki_list = [{'path': '~/Dropbox/Notes/', 'syntax': 'markdown', 'ext': '.md'}]

" NeoComplete - https://github.com/Shougo/neocomplete.vim
Plugin 'Shougo/neocomplete.vim'
let g:acp_enableAtStartup = 0 " Disable AutoComplPop.
let g:neocomplete#enable_at_startup = 1 " Use neocomplete.
let g:neocomplete#enable_smart_case = 1 " Use smartcase.
let g:neocomplete#sources#syntax#min_keyword_length = 3 " Set minimum syntax keyword length.

" Supertab
Plugin 'ervandew/supertab'

" Start screen
Plugin 'mhinz/vim-startify'

" Rooter changes `pwd` to the 'project root' of current open file
Plugin 'airblade/vim-rooter'

" Load local plugins if any
silent! so ~/.vimlocalplugins
silent! so .vimlocalplugins

call vundle#end()
filetype plugin indent on

" Activate solarized colortheme
colorscheme solarized
let g:airline_theme='solarized'

" Local customizations, if any
silent! so ~/.vimlocal
silent! so .vimlocal
