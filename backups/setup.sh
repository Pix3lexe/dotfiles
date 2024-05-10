#!/bin/bash
# params $1 = 'home' if youre using your current setup
# RUN AT YOUR OWN RISK!!
y | LC_ALL=en_US.UTF-8 sudo pacman -Syu
y | LC_ALL=en_US.UTF-8 sudo pacman -S git neovim neofetch tmux nvidia nvidia-settings nvidia-settings curl
# get dotfiles
git clone --bare https://github.com/Pix3lexe/dotfiles.git $HOME/.dotfiles
alias dotfiles='/usr/bin/git --git-dir="$HOME/.dotfiles/" --work-tree="$HOME"'
dotfiles checkout -f
dotfiles config --local status.showUntrackedFiles no
# install oh-my-posh
sudo curl -s https://ohmyposh.dev/install.sh | bash -s
# install pyenv
sudo curl https://pyenv.run | bash

#setup xorg.conf
if [ $1 = 'home' ]; then
    yes | sudo cp -f $HOME/backups/xorg.conf.bak /etc/X11/xorg.conf
    # setup kernel params
    sudo touch /etc/modprobe.d/nvidia.conf
    sudo echo "options nvidia_drm modeset=1" >> /etc/modprobe.d/nvidia.conf
fi

git config --global user.name "Simon Hermanns"
git config --global user.email "hermanns.simon@gmail.com"

# after that (if youre using gnome) install the following extensions: AppIndicator and KStatusNotifierItem Support, Blur my Shell, Coverflow Alt-Tab, Dash to Dock, [QSTweak] Quick Setting Tweaker, Unblank lock screen, User Themes
# Install the theme: Layan-Dark
# Install Sweet-cursors and Deepin2022-Dark icons
