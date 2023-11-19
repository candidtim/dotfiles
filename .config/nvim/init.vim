"
" Configuration
"

" Commonly-used settings
set cursorline          " highlight the line the cursor is on
set scrolloff=3         " make some context visible
set nowrap              " don't wrap long lines
set timeoutlen=250      " Esc faster
set notimeout           " Leader doesn't time out
set clipboard+=unnamedplus " use the system clipboard
set number              " show line numbers
set relativenumber      " or actually relative numbers on all lines except current
set signcolumn=number   " show signs in place of line numbers
set ignorecase          " case-insensitive search
set smartcase           " consider case if search starts with Uppercase

" Indentation, tabs
set smartindent
set autoindent
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab           " use TAB to insert spaces

" Show the 80-char limit
set colorcolumn=80
highlight ColorColumn ctermbg=grey guibg=grey

" Do not show ~ at the end of the buffers
let &fcs='eob: '

" Autoread and autowrite
set autoread            " autoread files when changed outside
set autowriteall        " autowrite files on change buffer, etc.
autocmd FocusLost * silent! wall " autosave when Vim loses focus (switch to other app)
autocmd BufWritePre * :%s/\s\+$//e " remove trailing whitespaces on save

" Capital W to write with sudo
comm W exec 'w !sudo tee % > /dev/null' | e!


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
" .. horizontal split:
nmap <Leader>h :split<CR>
" .. even out all splits:
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

" wrap current visual selection in Markdown *italics* and **bold** syntax
vmap <Leader>i S*
vmap <Leader>b S*lvt*S*

" Abbreviations
iab <expr> dts strftime("%Y-%m-%d")
iab tt [ ]

" Alias :Q to :q!
command Q q! "

"
" Plugins
"

call plug#begin()

" NERDTree
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
let g:NERDTreeWinPos = "right" " NERDTree on the right side
let g:NERDTreeMouseMode = 2
let g:NERDTreeMinimalMenu=1
let g:NERDTreeRespectWildIgnore=1
" close vim if all buffers are closed, but the NERDTree
au bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" mappings:
map <Leader>nn :NERDTreeToggle<CR>
map <Leader>nf :NERDTreeFind<CR>

" NERDCommenter
Plug 'preservim/nerdcommenter'

" AirLine
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
set laststatus=2
set noshowmode

" Fuzzy find
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
set rtp+=~/.fzf
set wildignore+=*/node_modules/*,*/build/*,*/target/*,*/.git/*,*/*.egg-info/*,*/dist/*,*.class,*/__pycache__/*,*.pyc

" delimitMate
" (inserts matching parenthesis, brackets, etc.)
Plug 'raimondi/delimitmate'

" Solarized
Plug 'altercation/vim-colors-solarized'
set t_Co=16
let g:solarized_termtrans = 1

" Ack (uses ag)
Plug 'mileszs/ack.vim', { 'on': 'Ack' }
let g:ackprg = 'ag --vimgrep'
let g:ackhighlight = 1
" mappings:
nmap <Leader>at :Ack "TODO\|FIXME"<CR>
nmap <Leader>aa :Ack!<Space>
nmap <Leader>af :Ack! "\b<cword>\b" <CR>

" Easy motion
Plug 'easymotion/vim-easymotion'
map <Leader><Leader> <Plug>(easymotion-prefix)
hi link EasyMotionShade Comment

" Vim Surround
Plug 'tpope/vim-surround'

" gitgutter
Plug 'airblade/vim-gitgutter'

" Fugitive
Plug 'tpope/vim-fugitive'

" Start screen
Plug 'mhinz/vim-startify'
let g:startify_custom_header = split(system('hnwelcome | cowsay -n'), '\n')

" Rooter (changes `pwd` to the 'project root' of current open file)
Plug 'airblade/vim-rooter'
let g:rooter_silent_chdir = 1 " don't echo when changing the root dir

" tmux navigator
Plug 'christoomey/vim-tmux-navigator'

" Slime
Plug 'jpalardy/vim-slime'
let g:slime_target = "tmux"

" VimWiki
Plug 'vimwiki/vimwiki', { 'on': 'VimwikiIndex' }
let g:vimwiki_list =
  \ [{'path': '~/Dropbox/Documents/notes/', 'syntax': 'markdown', 'ext': '.md'}]
nmap <Leader>ww :VimwikiIndex<CR>
nmap <Leader>wf :lopen<CR><C-W>x<C-W>r:VimwikiSearch<Space>
nmap <Leader>wt :lopen<CR><C-W>x<C-W>r:VimwikiSearchTags<Space>

" Markdown preview
Plug 'instant-markdown/vim-instant-markdown', {'for': 'markdown', 'do': 'yarn install'}
let g:instant_markdown_autostart = 0

" Rainbow parentheses
Plug 'junegunn/rainbow_parentheses.vim'

" Copilot
Plug 'github/copilot.vim'

" LSP configs
Plug 'neovim/nvim-lspconfig'

call plug#end()

" Activate the colortheme
set background=light
colorscheme solarized
let g:airline_theme='solarized'
highlight CursorLineNr term=bold cterm=bold gui=bold guifg=Yellow
highlight clear SignColumn

" Load lua/init.lua
lua require('init')
