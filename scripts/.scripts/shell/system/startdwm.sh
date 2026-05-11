#!/bin/sh

#Setting environment variable for QT5
export QT_QPA_PLATFORMTHEME=qt5ct 

# Resolution
if [ $(cat /sys/class/drm/card0-HDMI-A-1/status) == "connected" ]; then
    xrandr --output HDMI-1 --auto --primary
    xrandr --output eDP-1 --off
fi

# Key Binds
xbindkeys

# DWM Status
exec dwmblocks &

# Compositor 
picom & 

# Wallpaper
nitrogen --restore & 

# Session Lock
xidlehook --not-when-audio --not-when-fullscreen --timer 1800 'slock' '' &

music_notify &

xhost +

# Loop for restarting dwm 
while true; do
    dwm >/dev/null 2>&1
done

# Execute DWM
exec dwm 

exec dunst
