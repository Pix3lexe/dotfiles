#!/bin/bash

if [ $XDG_CURRENT_DESKTOP = 'GNOME' ]; then
    dconf load /org/gnome/ < /home/simon/backups/gnome-desktop.conf
    #if you want a gtk theme
    #export GTK_THEME=Layan-Dark
fi
