#!/bin/bash
git clone https://github.com/Pix3lexe/dotfiles.git
rm -rf $HOME/.config/nvim/*
cp -r $HOME/dotfiles/.config/nvim/* $HOME/.config/nvim/
rm -rf $HOME/dotfiles && nvim || echo "Something went wrong"
