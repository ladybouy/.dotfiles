#!/bin/sh

# start some nice programs
#Setting environment variable for QT5
export QT_QPA_PLATFORMTHEME=qt5ct 

# Key Binds
xbindkeys

# DWM Status
exec dwmblocks &

# Compositor 
picom & 

# Wallpaper
nitrogen --restore & 

# Session Lock
xidlehook --not-when-audio --not-when-fullscreen --timer 600 'slock' '' &

music_notify & 

xhost +

# Loop for restarting dwm 
while true; do
    dwm >/dev/null 2>&1
done

# Execute DWM
exec dwm 

exec dunst
