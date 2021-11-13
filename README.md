# dotfiles

.bashrc, .zshrc, .vimrc and the company

## Fresh install

    mkdir ~/src
    git clone https://github.com/candidtim/dotfiles.git ~/src/dotfiles
    cd ~/src/dotfiles
    cat install-su.sh | sudo bash
    source install.sh

### Install tmux plugins

Start `tmux` and type "Prefix + I"

## Other

### sudo password feedback

 - Show `sudo` password as you type: `sudo visudo` and add `pwfeedback` after
   `env_reset` (comma-separated)

### Gnome tweaks

 - Keyboard: enable compose key

### Firefox configuration

To enable user stylesheets: `about:config`  set
`toolkit.legacyUserProfileCustomizations.stylesheets` to `true`.

To hide the tabs in the header, add following content to
`~/.mozilla/firefox/<PROFILE>/chrome/userChrome.css`:

    @namespace url(http://www.mozilla.org/keymaster/gatekeeper/there.is.only.xul);
    #TabsToolbar {
        visibility:collapse!important;
    }
    #sidebar-box[sidebarcommand="treestyletab_piro_sakura_ne_jp-sidebar-action"] #sidebar-header {
        display:none;
    }

### For Docker

    firewall-cmd --zone=FedoraWorkstation --add-masquerade --permanent
    firewall-cmd --reload

## Desktop

Restore Cinnamon configuration:

    dconf load /org/cinnamon/ < ~/src/dotfiles/cinnamon.dconf.dump

Save Cinnamon configuration, if changed:

    dconf dump /org/cinnamon/ > ~/src/dotfiles/cinnamon.dconf.dump
