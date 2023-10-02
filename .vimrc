"
" General config
"

syntax enable
filetype plugin indent on

set nocompatible        " don't care about Vi compatibility
set cursorline          " highlight the line the cursor is on
set encoding=utf-8      " utf-8 everywhere by default
set printencoding=utf-8 " utf-8 everywhere by default
set title               " set title in terminal emulator
set scrolloff=3         " make some context visible
set mouse=a             " enable mouse
set ttymouse=sgr        " enable mouse in tmux and past column 223 (see :h sgr-mouse)
set wrap                " don't wrap long lines
set showmatch           " show matching brackets
set matchtime=5         " showmatch briefly
set timeoutlen=250      " Esc faster
set notimeout           " Leader doesn't time out
set clipboard^=unnamed,unnamedplus " copy to the system clipboard
set backspace=indent,eol,start     " backspace by indent, over lines, start of insert
set wildmenu                   " open a menu to complete a command
set wildmode=longest,list:full " list all options, complete to longest match, open menu
" .. line numbers
set number              " show line numbers
set relativenumber      " or actually relative numbers on all lines except current
set signcolumn=yes      " always show sign column
highlight! clear SignColumn " signcolumn with no background color
" highlight link SignColumn LineNr " signcolumn with no background color
" .. search
set hlsearch            " highlight search results
set ignorecase          " case-insensitive search, see next one
set smartcase           " consider case if search starts with Uppercase
set incsearch           " show mathes while typing
" .. indentation
set smartindent
set autoindent          " copy indent from previous line
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab           " use TAB to insert spaces
set formatoptions+=j    " sane line joins
" .. disable visual bell
set t_vb=
" .. show 88 chars limit column
set colorcolumn=88
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
" completion
set completeopt=menu,popup

"
" Autosave and autoread
"
set autoread            " autoread files when changed outside

set hidden              " allow hidden buffers
set autowriteall        " autowrite files on change buffer, etc.
autocmd FocusLost * silent! wall " autosave when Vim loses focus (switch to other app)
autocmd BufWritePre * :%s/\s\+$//e        " remove trailing whitespaces on write

"
" Custom commands
"
comm! W exec 'w !sudo tee % > /dev/null' | e!  " capital W to write with sudo

"
" Key mappings
"

" use spacebar as leader
let mapleader = " "

" command with ;
nnoremap ; :

" up and down on wrapped lines
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

" keep current split only à-la Emacs
nmap <C-x>1 :only<CR>

" save, open, tags, switch buffers, etc.:
" .. save buffer:
nmap <Leader>fs :w<CR>
" .. reload buffer:
nmap <Leader>fe :e<CR>
" .. find files:
nmap <Leader>ff :Files<CR>
" .. find 'project' files (in Git repo):
nmap <Leader>fp :GFiles<CR>
" .. find in file edit history:
nmap <Leader>fh :History<CR>
" .. list buffers:
nmap <Leader>bb :Buffers<CR>
" .. close buffer:
nmap <Leader>bd :bd<CR>
" .. list tags:
nmap <Leader>tt :Tags<CR>
" .. generate tags:
nmap <Leader>tg :!ctags -R .<CR>
" .. quit:
nmap <Leader>q :quit<CR>
" .. vertical split:
nmap <Leader>v :vsplit<CR>
" .. split:
nmap <Leader>h :split<CR>
" .. even all splits:
nmap <Leader>= <C-W>=
" remove search highlight:
nmap <silent> <Leader>. :nohlsearch<CR>

" temp macros: start with qq, stop with q, repeat with Q
nmap Q @q

" make 0 jump between ^ and 0
nmap <expr> <silent> 0 col('.') == match(getline('.'),'\S')+1 ? '0' : '^'

" lnext / lprev / cnext / cprev
nmap <Leader>ln :lnext<CR>
nmap <Leader>lp :lprev<CR>
nmap <Leader>cn :cnext<CR>
nmap <Leader>cp :cprev<CR>

" spell check
" .. enable Enligsh spell check:
nmap <Leader>se :set spell spelllang=en_us<CR>
" .. enable French spell check:
nmap <Leader>sf :set spell spelllang=fr_fr<CR>
" .. disable spell check:
nmap <Leader>so :set nospell<CR>

" sort a paragraph
nmap <Leader>ps vip:sort<CR>

" wrap current visual selection in Markdown *italics* and **bold** syntax
vmap <Leader>i S*
vmap <Leader>b S*lvt*S*

"
" Abbreviations
"
iab <expr> dts strftime("%Y-%m-%d")
iab tt [ ]

"
" Plugins
"
" .. enable Vundle
filetype off " required for Vundle, ractivate afterwards
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" .. vundle manages itself too
Plugin 'VundleVim/Vundle.vim'

" NERDTree
Plugin 'scrooloose/nerdtree'
let g:NERDTreeWinPos = "right" " NERDTree on the right side
let g:NERDTreeMouseMode = 2
let g:NERDTreeMinimalMenu=1
let g:NERDTreeRespectWildIgnore=1
autocmd VimEnter * NERDTree " Open NERDTree when Vim starts
autocmd VimEnter * wincmd p " .. and then jump to the 'main' window afterwards
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
let g:airline_powerline_fonts = 1

" Fuzzy find
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
set rtp+=~/.fzf
set wildignore+=*/node_modules/*,*/build/*,*/target/*,*/.git/*,*/*.egg-info/*,*/dist/*,*.class,*/__pycache__/*,*.pyc

" YCM
Plugin 'ycm-core/YouCompleteMe'

" delimitMate
Plugin 'raimondi/delimitmate'

" Python PEP-8 indent
Plugin 'Vimjas/vim-python-pep8-indent'

" JSX
Plugin 'maxmellon/vim-jsx-pretty'

" Solarized Theme
" Plugin 'altercation/vim-colors-solarized'
" set background=light
" set t_Co=16
" let g:solarized_termtrans = 1
" cannot activate the colorscheme here becuase bundle is not yet available
" https://github.com/VundleVim/Vundle.vim/issues/119
" activated after Vundle.end

" Everforest Theme
Plugin 'sainnhe/everforest'
set background=light

" ALE (integrates linters)
Plugin 'w0rp/ale'
let g:airline#extensions#ale#enabled = 1
let g:ale_python_pylsp_auto_poetry = 1
let g:ale_lint_on_enter = 0
let g:ale_sign_error = '>'
let g:ale_sign_warning = '>'
let g:ale_fix_on_save = 1
let g:ale_fixers =
  \ {
  \ 'python': ['isort', 'black'],
  \ 'javascript': ['prettier'],
  \ 'css': ['prettier']
  \ }

" Ack (uses ag)
Plugin 'mileszs/ack.vim'
let g:ackprg = 'ag --vimgrep'
let g:ackhighlight = 1
" .. mappings:
map <F4> :Ack "TODO\|FIXME"<CR>
nmap <Leader>a :Ack!<Space>
map <F7> :Ack! "\b<cword>\b" <CR>

" Easy motion
Plugin 'easymotion/vim-easymotion'
map <Leader><Leader> <Plug>(easymotion-prefix)
hi link EasyMotionShade Comment

" Vim Surround
Plugin 'tpope/vim-surround'

" gitgutter
Plugin 'airblade/vim-gitgutter'

" Fugitive
Plugin 'tpope/vim-fugitive'

" Start screen
Plugin 'mhinz/vim-startify'

" Rooter (changes `pwd` to the 'project root' of current open file)
Plugin 'airblade/vim-rooter'
let g:rooter_silent_chdir = 1 " don't echo when changing the root dir

" tmux navigator
Plugin 'christoomey/vim-tmux-navigator'

" VimWiki
Plugin 'vimwiki/vimwiki'
let g:vimwiki_list =
  \ [{'path': '~/Dropbox/Documents/notes/', 'syntax': 'markdown', 'ext': '.md'}]
nmap <Leader>wf :lopen<CR><C-W>x<C-W>r:VimwikiSearch<Space>
nmap <Leader>wt :lopen<CR><C-W>x<C-W>r:VimwikiSearchTags<Space>

" Slimv
Plugin 'kovisoft/slimv'

" Rainbow parentheses
Plugin 'junegunn/rainbow_parentheses.vim'

call vundle#end()
filetype plugin indent on

" Activate solarized colortheme
colorscheme solarized
let g:solarized_diffmode="high"
let g:airline_theme='solarized'
highlight CursorLineNr term=bold cterm=bold gui=bold guifg=Yellow
