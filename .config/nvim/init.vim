"
" Configuration
"

" Commonly-used settings
set cursorline          " highlight the line the cursor is on
set scrolloff=3         " make some context visible
set wrap                " wrap long lines
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

" Do not show ~ at the end of the buffers
let &fcs='eob: '

" Autoread and autowrite
set autoread            " autoread files when changed outside
" set autowriteall        " autowrite on :quit
autocmd InsertLeave,TextChanged,FocusLost * silent! wall " autosave
autocmd BufWritePre * :%s/\s\+$//e " remove trailing whitespaces on save

" Capital W to write with sudo
comm W exec 'w !sudo tee % > /dev/null' | e!

" File types
au BufNewFile,BufRead justfile setf make


"
" Key mappings
"

" use spacebar as leader
let mapleader = " "

" up and down on wrapped lines
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

" keep the current split only, à-la Emacs
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

" Reload config
nmap <Leader>rf :source ~/.config/nvim/init.vim<CR>

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
let g:NERDTreeIgnore=['__pycache__']
" close vim if all buffers are closed but the NERDTree
au bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" mappings:
map <C-e> :NERDTreeToggle<CR>
map <Leader>nn :NERDTreeToggle<CR>
map <Leader>nf :NERDTreeFind<CR>

" NERDCommenter
Plug 'preservim/nerdcommenter'

" AirLine
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
set laststatus=2
set noshowmode
let g:airline_powerline_fonts = 1
let g:airline_theme='wombat'  " solarized

" Fuzzy find
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
set rtp+=~/.fzf
set wildignore+=*/node_modules/*,*/build/*,*/target/*,*/.git/*,*/*.egg-info/*,*/dist/*,*.class,*/__pycache__/*,*.pyc,*.fasl

" delimitMate
" (inserts matching parenthesis, brackets, etc.)
Plug 'raimondi/delimitmate'

" Solarized
Plug 'lifepillar/vim-solarized8', { 'branch': 'neovim' }
set termguicolors
set background=dark
let g:solarized_visibility = "low"
let g:solarized_italics = 0
autocmd vimenter * ++nested colorscheme retrobox  " solarized8

" Ack (uses ag)
Plug 'mileszs/ack.vim', { 'on': 'Ack' }
let g:ackprg = 'ag --hidden --vimgrep'
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
let g:gitgutter_override_sign_column_highlight = 0

" Fugitive
Plug 'tpope/vim-fugitive'

" Start screen
Plug 'mhinz/vim-startify'
let g:startify_custom_header = ''
let g:startify_change_to_dir = 0
let g:startify_change_to_vcs_root = 1

" Rooter (changes `pwd` to the 'project root' of current open file)
Plug 'airblade/vim-rooter'
let g:rooter_silent_chdir = 1 " don't echo when changing the root dir

" tmux navigator
Plug 'christoomey/vim-tmux-navigator'

" Vlime
Plug 'vlime/vlime', {'rtp': 'vim/'}
let g:vlime_compiler_policy = {"DEBUG": 3}
nnoremap <expr> <LocalLeader>ql
  \ ":call vlime#plugin#SendToREPL('(asdf:load-system \"" . input("System name: ") . "\")')<CR>"
nnoremap <expr> <LocalLeader>qt
  \ ":call vlime#plugin#SendToREPL('(asdf:test-system \"" . input("System name: ") . "\")')<CR>"

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
Plug 'kien/rainbow_parentheses.vim'
function! SetupRainbowParens()
    autocmd FileType lisp,clojure,scheme,json RainbowParenthesesActivate
    autocmd Syntax lisp,clojure,scheme RainbowParenthesesLoadRound
    autocmd Syntax clojure RainbowParenthesesLoadSquare
    autocmd Syntax json RainbowParenthesesLoadBraces
endfunction
autocmd VimEnter * call SetupRainbowParens()

" Copilot
" Plug 'github/copilot.vim'
" disable by default
" let g:copilot_filetypes = {'*' : v:false}

" LSP configs
Plug 'neovim/nvim-lspconfig'

call plug#end()

" Load lua/init.lua
lua require('init')
