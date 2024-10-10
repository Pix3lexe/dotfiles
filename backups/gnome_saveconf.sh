#!/bin/bash

BACKUP_PATH="/home/simon/backups/"
BACKUP_DIR="$BACKUP_PATH/gnome_backups"
BACKUP_BASE="gnome-desktop_$(date +%d%m%Y)"
BACKUP_FILE="$BACKUP_DIR/$BACKUP_BASE.conf"
mkdir -p "$BACKUP_DIR"

# check if backup already exists
if [ -f "$BACKUP_FILE" ]; then
    i=1
    while [ -f "$BACKUP_DIR/${BACKUP_BASE}_$i.conf" ]; do
        ((i++))
    done
    BACKUP_FILE="$BACKUP_DIR/${BACKUP_BASE}_$i.conf"
fi

mv "$BACKUP_PATH/gnome-desktop.conf" "$BACKUP_FILE"
dconf dump /org/gnome/ > "$BACKUP_PATH/gnome-desktop.conf"
