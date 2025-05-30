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
sudo usermod -aG input $USER # for capslock waybar indicator

# after that (if youre using gnome only!) install the following extensions: AppIndicator and KStatusNotifierItem Support, Blur my Shell, Coverflow Alt-Tab, Dash to Dock, [QSTweak] Quick Setting Tweaker, Unblank lock screen, User Themes
# Install the theme: Layan-Dark
# Install Sweet-cursors and Deepin2022-Dark icons
