sudo apt-get install dconf-cli

git clone https://github.com/Anthony25/gnome-terminal-colors-solarized.git ~/.solarized
wget -O ~/.solarized/dircolors https://raw.githubusercontent.com/huyz/dircolors-solarized/master/dircolors.ansi-dark
cd ~/.solarized
./install.sh
