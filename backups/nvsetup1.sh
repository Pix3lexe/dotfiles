#!/bin/bash
rm -rf $HOME/.config/nvim
rm -rf $HOME/.local/share/nvim
git clone https://github.com/NvChad/starter ~/.config/nvim && nvim
