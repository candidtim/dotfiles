"
" General config
"
let mapleader = ","     " remap leader to ,
syntax enable
filetype plugin indent on
set nocompatible        " don't care about Vi compatibility
set cursorline          " highlight the line the cursor is on
set encoding=utf-8      " utf-8 everywhere by default
set printencoding=utf-8 " utf-8 everywhere by default
" set hidden            " why would I do this?
set title               " set title in terminal emulator
set scrolloff=3         " make some context visible
set mouse=a             " enable mouse
set wrap                " don't wrap long lines
set showmatch           " show matching brackets
set matchtime=5         " showmatch briefly
set timeoutlen=250      " Esc faster
set autowrite           " autowrite files on change buffer, etc.
set autoread            " autoread files when changed outside
set clipboard^=unnamed,unnamedplus " copy to clipboard
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
" .. show 120 chars limut column
set colorcolumn=120
highlight ColorColumn ctermbg=grey guibg=grey
" .. backup
set backupdir=~/.vimbackup
set directory=~/.vimswap
" .. ctags
set tags=./tags;$HOME   " search tags correctly in local dir and up to home
" .. don't show ~ after end of buffer
autocmd VimEnter * :highlight NonText ctermfg=black guifg=bg
" highlight EndOfBuffer ctermfg=bg ctermbg=bg " use this in Vim 8
" .. save undo-s longer
set undofile
set undodir=$HOME/.vim/undo
set undolevels=1000
set undoreload=10000

"
" Behaviour
"
" .. remove trailing whitespaces on save
autocmd BufWritePre * :%s/\s\+$//e


"
" File associations
"
autocmd BufNewFile,BufRead *.gradle setf groovy


"
" Key mappings
"
" menu with ;
nnoremap ; :
" remove search highlight with Space
nnoremap <silent> <Space> :nohlsearch<CR>
nnoremap <silent> <Leader> <Space> :sign unplace *<CR>
" up and down on wrapped lines
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk
" remap F1 to Esc (F1 hit accidentally causes Help open in GUI)
map <F1> <Esc>
imap <F1> <Esc>
" F2 to generate tags
map <F2> :!ctags -R .<CR>
" F9 to search usages of the word under cursor with Ack
map <F9> yiw:Ack! <C-R>"<CR>
" F10 to find current file in NERDTree
map <F10> :NERDTreeFind<CR>
" F12 to lookup ALL tags
map <F12> :CtrlPTag<CR>
" W to write with sudo
comm! W exec 'w !sudo tee % > /dev/null' | e!
" manage buffers: F6 to close, F7 and F8 for previous and next
map <F6> :bp <BAR> bd #<CR>
map <F7> :bp<CR>
map <C-PageUp> :bp<CR>
map <C-PageDown> :bn<CR>
map <F8> :bn<CR>
imap <F7> <Esc> :bp<CR>
imap <F8> <Esc> :bn<CR>
" do not attempt to apply F7 and F8 when in NERDTree
autocmd FileType nerdtree noremap <buffer> <F7> <nop>
autocmd FileType nerdtree noremap <buffer> <F8> <nop>
" use `Shift-F6` to rename current higlight globally
nmap <expr> <S-F6> ':%s/' . @/ . '//gc<LEFT><LEFT><LEFT>'
" temp macros: start with qq, stop with q, repeat with Q
nnoremap Q @q
" make 0 jump between ^ and 0
noremap <expr> <silent> 0 col('.') == match(getline('.'),'\S')+1 ? '0' : '^'



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
let g:NERDTreeChDirMode = 2 " Vim's CWD follows NERDTree's root
map <C-e> :NERDTreeToggle<CR>  " Ctrl-e toggles NERDTree
" open NERDTree if vim called with no arguments
au StdinReadPre * let s:std_in=1
au VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" close vim if all files closed
au bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" NERDCommenter
" Plugin 'scrooloose/nerdcommenter'

" AirLine
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
set laststatus=2
set noshowmode
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_powerline_fonts = 1



" Ctrl-P  TODO: replace with ???
Plugin 'kien/ctrlp.vim'
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlPMixed'
" let g:ctrlp_custom_ignore = {
"   \ 'dir':  '\v[\/]\.(git|gradle)$',
"   \ 'file': '\v\.(class|pyc)$',
"   \ }
set wildignore+=*/node_modules/*,*/build/*,*.class,*.pyc

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

" Syntastic
Plugin 'scrooloose/syntastic'
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_check_on_wq = 0 " do not run syntastic when writing before quit (yet run on normal writes)
let g:syntastic_error_symbol = '=>'
let g:syntastic_warning_symbol = '->'

" Ack (used with ag)
Plugin 'mileszs/ack.vim'
let g:ackprg = 'ag --nogroup --nocolor --column'

" Easy motion
Plugin 'easymotion/vim-easymotion'
map <Leader><Leader> <Plug>(easymotion-prefix)
hi link EasyMotionShade Comment

" Scala
Plugin 'derekwyatt/vim-scala'

" Javascript
Plugin 'pangloss/vim-javascript'

" JSX
Plugin 'mxw/vim-jsx'
let g:jsx_ext_required = 0

" Vim Slime
Plugin 'jpalardy/vim-slime'
let g:slime_target = "tmux"

" Vim Surround
Plugin 'tpope/vim-surround'

" Fugitive
Plugin 'tpope/vim-fugitive'

" gitgutter
Plugin 'airblade/vim-gitgutter'

" Vim Wiki
Plugin 'vimwiki/vimwiki'
let g:vimwiki_list = [{'path': '~/Dropbox/Notes/', 'syntax': 'markdown', 'ext': '.md'}]

" NeoComplete - https://github.com/Shougo/neocomplete.vim
Plugin 'Shougo/neocomplete.vim'
let g:acp_enableAtStartup = 0 " Disable AutoComplPop.
let g:neocomplete#enable_at_startup = 1 " Use neocomplete.
let g:neocomplete#enable_smart_case = 1 " Use smartcase.
let g:neocomplete#sources#syntax#min_keyword_length = 3 " Set minimum syntax keyword length.

" ghc-mod
" Plugin 'eagletmt/ghcmod-vim'
" au FileType haskell nnoremap <buffer> <F3> :HdevtoolsType<CR>
" au FileType haskell nnoremap <buffer> <silent> <F2> :HdevtoolsClear<CR>
" map <silent> tw :GhcModTypeInsert<CR>
" map <silent> ts :GhcModSplitFunCase<CR>
" map <silent> tq :GhcModType<CR>
" map <silent> te :GhcModTypeClear<CR>

" UltiSnip
Plugin 'SirVer/ultisnips'
let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/UltiSnips']
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsListSnippets="<c-e>"
" UltiSnips completion function that tries to expand a snippet. If there's no
" snippet for expanding, it checks for completion window and if it's
" shown, selects first element. If there's no completion window it tries to
" jump to next placeholder. If there's no placeholder it just returns TAB key
function! g:UltiSnips_Complete()
    call UltiSnips#ExpandSnippet()
    if g:ulti_expand_res == 0
        if pumvisible()
            return "\<C-n>"
        else
            call UltiSnips#JumpForwards()
            if g:ulti_jump_forwards_res == 0
               return "\<TAB>"
            endif
        endif
    endif
    return ""
endfunction
" YCM and neocomplete sets its completion after Vim starts, this is to override it afterwards
au BufEnter * exec "inoremap <silent> " . g:UltiSnipsExpandTrigger . " <C-R>=g:UltiSnips_Complete()<cr>"
" this maps Enter key to <C-y> to chose the current highlight and close the selection list
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" BufExplorer
Plugin 'jlanzarotta/bufexplorer'
map <F3> :BufExplorer<CR>
imap <F3> <Esc> :BufExplorer<CR>

" EditorConfig
Plugin 'editorconfig/editorconfig-vim'

" Auto Pairs
Plugin 'jiangmiao/auto-pairs'
let g:AutoPairsFlyMode = 1

" Load local plugins if any
silent! so ~/.vimlocalplugins
silent! so .vimlocalplugins

call vundle#end()
filetype plugin indent on

" Activate solarized colortheme
colorscheme solarized
let g:airline_theme='solarized'

" Finally, allow local customizations, if any
silent! so ~/.vimlocal
silent! so .vimlocal
