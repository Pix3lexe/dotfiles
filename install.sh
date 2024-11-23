#!/bin/bash

# Install core dependencies using pacman
sudo pacman -S --needed - < <(grep -vE '^\s*#|^\s*$' requirements.txt)

# Install AUR dependencies using paru (or replace with yay)
if command -v paru &> /dev/null; then
    paru -S --needed - < <(grep -vE '^\s*#|^\s*$' requirements.txt)
elif command -v yay &> /dev/null; then
    yay -S --needed - < <(grep -vE '^\s*#|^\s*$' requirements.txt)
else
    echo "No AUR helper found (paru or yay). Please install AUR dependencies manually."
fi
