mkdir -p ~/.vim/autoload ~/.vim/bundle && curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
mkdir ~/.vimswap
mkdir ~/.vimbackup

# Neovim
mkdir -p ~/.config
ln -s ~/.vim ~/.config/nvim
ln -s ~/.vimrc ~/.config/nvim/init.vim


# NERDTree
# https://github.com/scrooloose/nerdtree
git clone https://github.com/scrooloose/nerdtree.git ~/.vim/bundle/nerdtree

# NERDCommenter
# https://github.com/scrooloose/nerdcommenter
git clone https://github.com/scrooloose/nerdcommenter.git ~/.vim/bundle/nerdcommenter

# vim-airline
# https://github.com/bling/vim-airline
git clone https://github.com/bling/vim-airline ~/.vim/bundle/vim-airline

# powerline fonts for vim-airline
# https://github.com/Lokaltog/powerline-fonts.git
git clone https://github.com/Lokaltog/powerline-fonts.git ~/.fonts
fc-cache -vf ~/.fonts/UbuntuMono
echo "\nPowerline fonts installed! Don't forget to update terminal profile"

# fugitive
# https://github.com/tpope/vim-fugitive
git clone git://github.com/tpope/vim-fugitive.git ~/.vim/bundle/fugitive

# ctrl.p
# https://github.com/kien/ctrlp.vim
git clone https://github.com/kien/ctrlp.vim.git ~/.vim/bundle/ctrlp

# Solarized
# https://github.com/altercation/vim-colors-solarized
git clone git://github.com/altercation/vim-colors-solarized.git ~/.vim/bundle/solarized

# Syntastic
# https://github.com/scrooloose/syntastic
git clone https://github.com/scrooloose/syntastic.git ~/.vim/bundle/syntastic

# ack.vim, for ag in fact
# https://github.com/mileszs/ack.vim
git clone https://github.com/mileszs/ack.vim.git ~/.vim/bundle/ack.vim

# easy motion
# https://github.com/easymotion/vim-easymotion
git clone https://github.com/easymotion/vim-easymotion ~/.vim/bundle/vim-easymotion

# vim-scala
# https://github.com/derekwyatt/vim-scala
git clone https://github.com/derekwyatt/vim-scala.git ~/.vim/bundle/vim-scala

# vim-javascript
# https://github.com/pangloss/vim-javascript
git clone https://github.com/pangloss/vim-javascript.git

# vim-jsx
# https://github.com/mxw/vim-jsx
git clone https://github.com/mxw/vim-jsx.git

# vim-sline
# https://github.com/jpalardy/vim-slime
git clone https://github.com/jpalardy/vim-slime.git ~/.vim/bundle/vim-slime

# vim-surround
# https://github.com/tpope/vim-surround
git clone git://github.com/tpope/vim-surround.git

# vimwiki
# http://github.com/vimwiki/vimwiki
git clone https://github.com/vimwiki/vimwiki.git

# YouCompleteMe
# https://github.com/Valloric/YouCompleteMe
git clone https://github.com/Valloric/YouCompleteMe.git ~/.vim/bundle/YouCompleteMe
echo "YouCompleteMe needs to be compiled! Initalize and update submodules, run ./install.sh"

echo "Alternative to YouCompleteMe is combination of deoplete/supertab/vimproc"
echo "Not installing those. See install script to uncomment according lines"
# git clone https://github.com/Shougo/deoplete.nvim.git
# git clone https://github.com/ervandew/supertab.git
# git clone https://github.com/Shougo/vimproc.vim.git

echo "Skipping some plugins, uncomment in script to install them:"
echo "? typescript-vim"
# git clone https://github.com/leafgarland/typescript-vim.git
echo "? neco-ghc"
# git clone https://github.com/eagletmt/neco-ghc
echo "? ghcmod-vim"
# git clone https://github.com/eagletmt/ghcmod-vim.git
