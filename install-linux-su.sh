#!/bin/bash

dnf -y install \
  curl cmake tmux git tig zsh \
  neovim the_silver_searcher \
  pipx nodejs

npm install -g diff-so-fancy
