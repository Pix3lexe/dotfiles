#!/bin/bash

if ! eww ping > /dev/null 2>&1; then
  eww daemon
  while ! eww ping > /dev/null 2>&1; do
    sleep 0.1
  done
fi

if ! eww active-windows | grep -q wallpaper-chooser; then
  eww open wallpaper-chooser
fi
