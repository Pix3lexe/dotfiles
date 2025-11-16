#!/bin/bash

# install core dependencies
sudo ./install.sh

# install pyenv
sudo curl https://pyenv.run | bash

# install TPM for tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# stow the directories
echo "Stowing directories..."
for dir in $(find . -maxdepth 1 -mindepth 1 -type d ! -name ".git" ! -name ".github" ! - name "git"); do
    dir_name=$(basename "$dir")
    echo "Stowing $dir_name..."
    stow -t ~ "$dir_name"
done

git submodule init
git submodule update
~/.config/eww/scripts/thumbnail_generator.sh
~/.config/eww/scripts/change-wallpaper.sh ~/.config/backgrounds/lofiwallpaper.png
sudo usermod -aG input $USER # for capslock waybar indicator

# Install Sweet-cursors
