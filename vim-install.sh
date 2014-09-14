mkdir -p ~/.vim/autoload ~/.vim/bundle && curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
mkdir ~/.vimswap
mkdir ~/.vimbackup

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

# vim-scala
# https://github.com/derekwyatt/vim-scala
git clone https://github.com/derekwyatt/vim-scala.git ~/.vim/bundle/vim-scala
