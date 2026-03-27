#!/bin/bash

# install core dependencies
sudo ./install.sh

# install pyenv
curl -fsSL https://pyenv.run | bash

# install TPM for tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# stow the directories
echo "Stowing directories..."
for dir in $(find . -maxdepth 1 -mindepth 1 -type d ! -name ".git" ! -name ".github" ! -name "git"); do
    dir_name=$(basename "$dir")
    echo "Stowing $dir_name..."
    stow -t ~ "$dir_name"
done

# git submodules
git submodule update --init --recursive
git lfs install
git submodule foreach git lfs pull

# generating wallpaper thumbnails + theme
~/.config/eww/scripts/thumbnail_generator.sh
~/.config/eww/scripts/change_wallpaper.sh ~/.config/backgrounds/walls-catppuccin-mocha/astronaut.png
sudo usermod -aG input $USER # for capslock waybar indicator

# Install Sweet-cursors
