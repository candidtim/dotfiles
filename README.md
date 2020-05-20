# dotfiles

.bashrc, .zshrc, .vimrc and the company

## Fresh install

    mkdir ~/src
    git clone https://github.com/candidtim/dotfiles.git ~/src/dotfiles
    sudo ./install-su.sh
    ./install.sh

## Sway

TODO

## i3 (deprecated, use Sway)

Install:

    install-i3wm.sh

And following steps are manual for the moment:

 - install Yosemite San Francisco fonts
 - install Font Awesome
 - install [Arc GTK Theme](https://github.com/horst3180/Arc-theme), and Firefox theme as well
 - install [Moka icons](https://snwh.org/moka)

## Other

### sudo password feedback

 - Show `sudo` password as you type: `sudo visudo` and add `pwfeedback` after
   `env_reset` (comma-separated)

### Gnome tweaks

 - Keyboard: enable compose key

### Firefox configuration

To enable user stylesheets: `about:config`  set
`toolkit.legacyUserProfileCustomizations.stylesheets` to `true`.

To hide the tabs in the header:

    @namespace url(http://www.mozilla.org/keymaster/gatekeeper/there.is.only.xul);
    #TabsToolbar {
        visibility:collapse!important;
    }
    #sidebar-box[sidebarcommand="treestyletab_piro_sakura_ne_jp-sidebar-action"] #sidebar-header {
        display:none;
    }

