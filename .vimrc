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
set ttymouse=xterm2     " enable mouse in tmux
set wrap                " don't wrap long lines
set showmatch           " show matching brackets
set matchtime=5         " showmatch briefly
set timeoutlen=250      " Esc faster
set notimeout           " Leader doesn't time out
set autowrite           " autowrite files on change buffer, etc.
set autoread            " autoread files when changed outside
set clipboard^=unnamed,unnamedplus " copy to the system clipboard
set backspace=indent,eol,start     " backspace by indent, over lines, start of insert
set wildmode=longest,list,full " zsh-like completion in ex
" set wildmenu
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
" .. show completion popups instead of preview window
if !has('nvim')
  set completepopup=height:10,width:60,highlight:InfoPopup
  set completeopt=menu,popup
endif
" .. disable bell
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

"
" File types
"
au BufRead,BufNewFile *.sbt set filetype=scala

"
" Autosave
"
autocmd BufWritePre * :%s/\s\+$//e " remove trailing whitespaces on save
autocmd BufLeave,FocusLost * silent! wall " autosave when switching buffers

"
" Code formatting
"
" autocmd BufWritePost *.js AsyncRun -post=checktime npm run prettier -- --write %
autocmd BufWritePost *.js AsyncRun -post=checktime prettier -- --write %
autocmd BufWritePost *.py AsyncRun -post=checktime black %

"
" Custom commands
"
comm! W exec 'w !sudo tee % > /dev/null' | e!  " W to write with sudo

"
" Custom $PATH
"
let $PATH .= '/home/$USER/bin:/home/$USER/.local/bin/'


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

" keep current split only à-la Emacs
nmap <C-x>1 :only<CR>

" save, open, tags, switch buffers, etc.:
" .. save buffer:
nmap <Leader>fs :w<CR>
" .. find files:
nmap <Leader>ff :Files<CR>
" .. find 'project' files (in Git repo):
nmap <Leader>fp :GFiles<CR>
" .. find in file edit history:
nmap <Leader>fh :History<CR>
" .. change dir to the currnet file's dir:
nmap <Leader>cd :lcd %:p:h<CR>
" .. list buffers:
nmap <Leader>bb :Buffers<CR>
" .. close buffer:
nmap <Leader>bd :bd<CR>
" .. list tags:
nmap <Leader>tt :Tags<CR>
" .. generate tags:
nmap <Leader>tg :!ctags -R .<CR>
" .. code actions:
nmap <Leader>c :CocAction<CR>
" .. quit:
nmap <Leader>q :quit<CR>
" .. vertical split:
nmap <Leader>v :vsplit<CR>
" .. split:
nmap <Leader>s :split<CR>
" remove search highlight:
nmap <silent> <Leader>. :nohlsearch<CR>

" map F1 to Esacpe
map <F1> <Esc>
imap <F1> <Esc>
" use `Shift-F6` to rename current highlight globally
nmap <expr> <S-F6> ':%s/' . @/ . '//gc<LEFT><LEFT><LEFT>'
"
" F11 to go "fullscreen" (open current window in new tab)
map <F11> :tab sp<CR>

" temp macros: start with qq, stop with q, repeat with Q
nmap Q @q

" make 0 jump between ^ and 0
nmap <expr> <silent> 0 col('.') == match(getline('.'),'\S')+1 ? '0' : '^'

" lnext / lprev
nmap ]q :lnext<CR>
nmap [q :lprev<CR>

" spell check
" .. enable Enligsh spell check:
nmap <Leader>se :set spell spelllang=en_us<CR>
" .. enable French spell check:
nmap <Leader>sf :set spell spelllang=fr_fr<CR>
" .. disable spell check:
nmap <Leader>so :set nospell<CR>

" sort a paragraph
nmap <Leader>ps vip:sort<CR>

" search Vimwiki
nmap <Leader>wf :lopen<CR><C-W>x<C-W>r:VimwikiSearch<Space>
nmap <Leader>wt :lopen<CR><C-W>x<C-W>r:VimwikiSearchTags<Space>

" wrap current visual selection in Markdown *italics* and **bold** syntax
vmap <Leader>i S*
vmap <Leader>b S*lvt*S*

"
" Abbreviations
"

" date
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
let NERDTreeMouseMode = 2
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
" let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_powerline_fonts = 1

" Fuzzy find
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
set rtp+=~/.fzf
set wildignore+=*/node_modules/*,*/build/*,*/.git/*,*/*.egg-info/*,*/dist/*,*.class,*.pyc

" Solarized Theme (for vim in terminal)
Plugin 'altercation/vim-colors-solarized'
set background=light
set t_Co=16
let g:solarized_termtrans = 1
" cannot activate the colorscheme here becuase bundle is not yet available
" https://github.com/VundleVim/Vundle.vim/issues/119
" activated after Vundle.end

" Codeschool Theme (for gvim)
Plugin 'antlypls/vim-colors-codeschool'

" ALE (integrates linters)
Plugin 'w0rp/ale'
let g:airline#extensions#ale#enabled = 1
let g:ale_lint_on_enter = 0
let g:ale_sign_error = '>'
let g:ale_sign_warning = '>'

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

" Polyglot (languages support)
" Plugin 'sheerun/vim-polyglot'
" let g:polyglot_disabled = ['markdown']
" " let g:polyglot_disabled = ['markdown', 'python', 'python-indent', 'ftdetect']

" Vim Slime
Plugin 'jpalardy/vim-slime'
" let g:slime_target = "tmux"
let g:slime_target = "vimterminal"
" let g:slime_vimterminal_cmd = "sbcl"
let g:slime_vimterminal_config = {"term_finish": "close"}
" nmap <c-c><c-l> :SlimeSend1 (laod "")
" send current buffer:
nmap <c-c><c-k> ggVG:SlimeSend<CR>
" SBCL quit debugger:
nmap <c-c>q     :SlimeSend0 "\x4"<CR>
" nmap <c-c><c-u> :SlimeSend0 "\x15"<CR>
" nmap <c-c>d <Plug>SlimeSendCell

" Vim Surround
Plugin 'tpope/vim-surround'

" gitgutter
Plugin 'airblade/vim-gitgutter'
nmap <C-n> :GitGutterNextHunk<CR>
nmap <M-n> :GitGutterPrevHunk<CR>
nmap <C-u> :GitGutterUndoHunk<CR>

" NeoComplete
Plugin 'Shougo/neocomplete.vim'
let g:acp_enableAtStartup = 0 " Disable AutoComplPop.
let g:neocomplete#enable_at_startup = 1 " Use neocomplete.
let g:neocomplete#enable_smart_case = 1 " Use smartcase.
let g:neocomplete#sources#syntax#min_keyword_length = 3 " Set minimum syntax keyword length.

" Deoplete
" Plugin 'shougo/deoplete.nvim'
" let g:deoplete#enable_at_startup = 1

" Supertab (complete with Tab)
Plugin 'ervandew/supertab'

" Start screen
Plugin 'mhinz/vim-startify'

" Rooter (changes `pwd` to the 'project root' of current open file)
Plugin 'airblade/vim-rooter'
let g:rooter_silent_chdir = 1 " don't echo when changing the root dir

" AsyncRun
Plugin 'skywind3000/asyncrun.vim'

" Coc (LSP)
" Plugin 'neoclide/coc.nvim'

"" Clojure

" Exclude dot from keywords (word motion)
" autocmd Syntax clojure set iskeyword-=.
" autocmd Syntax clojure set iskeyword+=-

" Rainbow Parenthesis (enabled for Clojure only)
" Plugin 'kien/rainbow_parentheses.vim'
" autocmd VimEnter * RainbowParenthesesToggle
" autocmd Syntax clojure RainbowParenthesesLoadRound
" autocmd Syntax clojure RainbowParenthesesLoadSquare
" autocmd Syntax clojure RainbowParenthesesLoadBraces

" Vim Iced and its requirements
" Plugin 'guns/vim-sexp'
" Plugin 'liquidz/vim-iced'
" .. enable vim-iced's default key mapping
" let g:iced_enable_default_key_mappings = v:true
" FIXME: consider activating clj-kondo
" let g:ale_linters = {'clojure': ['clj-kondo']}

"" .. end of Clojure plugins

" tmux navigator
Plugin 'christoomey/vim-tmux-navigator'

" VimWiki
Plugin 'vimwiki/vimwiki'
let g:vimwiki_list =
  \ [
  \ {'path': '~/Dropbox/Documents/notes/',
  \  'syntax': 'markdown', 'ext': '.md',
  \  'path_html': '~/Documents/notes/',
  \  'template_path': '~/Dropbox/Documents/notes/templates/',
  \  'template_default': 'default',
  \  'template_ext': '.tpl',
  \  'custom_wiki2html': 'vimwiki_markdown'},
  \ {'path': '~/Dropbox/Documents/notes-s2/', 'syntax': 'markdown', 'ext': '.md'}
  \ ]
" let g:vimwiki_customwiki2html='/home/trubeko/.local/bin/vimwiki_markdown'

" Load local plugins if any
silent! so ~/.vimlocalplugins
silent! so .vimlocalplugins

call vundle#end()
filetype plugin indent on

" Activate solarized colortheme
colorscheme solarized
let g:airline_theme='solarized'
highlight CursorLineNr term=bold cterm=bold gui=bold guifg=Yellow

" Local customizations, if any
silent! so ~/.vimlocal
silent! so .vimlocal

