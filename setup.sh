#!/bin/bash

#update system
y | LC_ALL=en_US.UTF-8 sudo pacman -Syu

# install some basic stuff
y | LC_ALL=en_US.UTF-8 sudo pacman -S base-devel git vim neovim neofetch tmux curl lazygit zsh fzf kitty zoxide ninja stow ttf-jetbrains-mono-nerd

# install pyenv
sudo curl https://pyenv.run | bash

# install TPM for tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# stow the directories
echo "Stowing directories..."
for dir in $(find . -maxdepth 1 -mindepth 1 -type d ! -name "git" ! -name ".github"); do
    dir_name=$(basename "$dir")
    echo "Stowing $dir_name..."
    stow -t ~ "$dir_name"
done

git config --global credential.helper store
# after that (if youre using gnome) install the following extensions: AppIndicator and KStatusNotifierItem Support, Blur my Shell, Coverflow Alt-Tab, Dash to Dock, [QSTweak] Quick Setting Tweaker, Unblank lock screen, User Themes
# Install the theme: Layan-Dark
# Install Sweet-cursors and Deepin2022-Dark icons
