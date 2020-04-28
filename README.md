# dotfiles

.bashrc, .zshrc, .vimrc and the company

## Fresh install

    wget https://raw.githubusercontent.com/candidtim/dotfiles/master/install.sh -O - | sh
    
## Doom emacs



## i3

I'm pretty sure I'm missing a lot of i3 configuration here,
because to the moment I only did it once and all manually, yet there are:

 * `/bin` - a couple of scripts to copy to `~/.bin`
 * `install-i3wm.sh` - to install requried pacakges to run i3

And following steps are manual for the moment:

 * install Yosemite San Francisco fonts
 * install Font Awesome
 * install [Arc GTK Theme](https://github.com/horst3180/Arc-theme), and Firefox theme as well
 * install [Moka icons](https://snwh.org/moka)

## Keep ctags automatically in sync

Use `~/.git_template/hooks` in Git repos to keep ctags up to date.

## Other (yet to automate)

 * Show `sudo` password as you type: `sudo visudo` and add `pwfeedback` after `env_reset` (comma-separated)
