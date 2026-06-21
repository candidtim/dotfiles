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

" Show tabs explicitly (and some other corner cases)
set list
set listchars=tab:>,trail:·,nbsp:·

" 'Ignored' files and directories (file search, etc.)
set wildignore+=*/node_modules/*,*/build/*,*/target/*,*/.git/*,*/*.egg-info/*,*/dist/*,*.class,*/__pycache__/*,*.pyc,*.fasl

" Autoread and autowrite
autocmd InsertLeave,TextChanged,FocusLost * silent! wall " autosave
autocmd BufWritePre * :%s/\s\+$//e " remove trailing whitespaces on save


"
" Key mappings and custom commands
"

" leader = SPC
let mapleader = " "

" up and down on wrapped lines
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

" minimal Emacs compatibility
nmap <C-x>1 :only<CR>
inoremap <C-g> <Esc>
cnoremap <C-g> <Esc>

" save, open, other behavior...
nmap <Leader>fs :w<CR>
nmap <Leader>fe :e<CR>
nmap <Leader>q :quit<CR>
nmap <Leader>v :vsplit<CR>
nmap <Leader>h :split<CR>
nmap <Leader>= <C-W>= " even out all splits
nmap <silent> <Leader>. :nohlsearch<CR> " remove search highlight

" temp macros: start with qq, stop with q, repeat with Q
nmap Q @q

" make 0 jump between ^ and 0
nmap <expr> <silent> 0 col('.') == match(getline('.'),'\S')+1 ? '0' : '^'
vmap <expr> <silent> 0 col('.') == match(getline('.'),'\S')+1 ? '0' : '^'

" location and quickfix lists
nmap <Leader>ln :lnext<CR>
nmap <Leader>lp :lprev<CR>
nmap <Leader>ll :llist<CR>
nmap <Leader>cn :cnext<CR>
nmap <Leader>cp :cprev<CR>
nmap <Leader>cl :clist<CR>

" spell check
nmap <Leader>se :set spell spelllang=en_us<CR>
nmap <Leader>sf :set spell spelllang=fr_fr<CR>
nmap <Leader>so :set nospell<CR>

" markdown editing:  *italics* and **bold**
vmap <Leader>i S*
vmap <Leader>b S*lvt*S*

" abbreviations
iab <expr> today strftime("%Y-%m-%d")

" reload config
nmap <Leader>rf :source ~/.config/nvim/init.vim<CR>

" capital W to write with sudo
comm W exec 'w !sudo tee % > /dev/null' | e!


"
" Colors
"
set background=light


"
" Plugins
"

call plug#begin()

" Theme
Plug 'ellisonleao/gruvbox.nvim'
autocmd vimenter * ++nested colorscheme gruvbox

" Common dependencies
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-tree/nvim-web-devicons'

" neo-tree
Plug 'MunifTanjim/nui.nvim'
Plug 'nvim-neo-tree/neo-tree.nvim'
map <C-e> :Neotree toggle<CR>
map <Leader>nn :Neotree toggle<CR>
map <Leader>nf :Neotree reveal<CR>
autocmd BufEnter * if winnr('$') == 1 && &filetype == 'neo-tree' | quit | endif
" more config in init.lua

" status line
Plug 'nvim-lualine/lualine.nvim'
set noshowmode

" autopairs
Plug 'windwp/nvim-autopairs'

" Telescope
Plug 'nvim-telescope/telescope.nvim'
" .. finding files
nmap <Leader>ff <cmd>Telescope find_files<CR>
nmap <Leader>fp <cmd>Telescope git_files<CR>
nmap <Leader>fh <cmd>Telescope oldfiles<CR>
nmap <Leader>fr <cmd>Telescope oldfiles<CR>
nmap <Leader>bb <cmd>Telescope buffers<CR>
" .. findging text
nmap <Leader>aa <cmd>Telescope live_grep<CR>
nmap <Leader>af <cmd>Telescope grep_string<CR>
nmap <Leader>at <cmd>Telescope grep_string search=TODO\|FIXME<CR>
" more config in init.lua

" Easy motion
Plug 'easymotion/vim-easymotion'
map <Leader><Leader> <Plug>(easymotion-prefix)
hi link EasyMotionShade Comment

" Vim Surround
Plug 'tpope/vim-surround'

" gitgutter
Plug 'airblade/vim-gitgutter'
let g:gitgutter_override_sign_column_highlight = 0

" fugitive
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

" Markdown preview
Plug 'instant-markdown/vim-instant-markdown', {'for': 'markdown', 'do': 'yarn install'}
let g:instant_markdown_autostart = 0
nmap <Leader>mp :InstantMarkdownPreview<CR>

" Rainbow parentheses
Plug 'kien/rainbow_parentheses.vim'
function! SetupRainbowParens()
  autocmd FileType json RainbowParenthesesActivate
  autocmd Syntax json RainbowParenthesesLoadBraces
endfunction
autocmd VimEnter * call SetupRainbowParens()

" Copilot
" Plug 'github/copilot.vim'
" let g:copilot_enabled = v:false
" imap <silent><script><expr> <C-c> copilot#Suggest()

" Minuet
Plug 'milanglacier/minuet-ai.nvim'  " config in init.lua

" LSP configs
Plug 'neovim/nvim-lspconfig'  " config in init.lua

call plug#end()

"
" Load lua config
"
lua require('init')
