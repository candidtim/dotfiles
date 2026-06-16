#!/bin/bash

source sync-back-mac.sh
sed -i '/user/,+2d' .gitconfig

cp -f ~/.zshrc .
