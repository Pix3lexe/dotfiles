#!/bin/bash

if [ $XDG_CURRENT_DESKTOP = 'GNOME' ]; then
    dconf load /org/gnome/ < /home/simon/backups/gnome-desktop.conf
fi
