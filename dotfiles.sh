#!/usr/bin/bash

case $1 in
  "download")
    git fetch -v 
    cp -riu -t ~/ .zshrc .vimrc .gvimrc .vim .xmonad/xmonad.hs .crawlrc .bashrc 
esac
