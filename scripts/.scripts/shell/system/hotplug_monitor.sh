#!/bin/bash

export DISPLAY=:0 
export XAUTHORITY=/home/$(whoami)/.Xauthority

function connect() {
    xrandr --output HDMI-1 --off
    xrandr --output HDMI-1 --auto --primary --left-of eDP-1
    xrandr --output eDP-1 --off
    xrdb -merge -I$HOME ~/.Xresources
    nitrogen --restore
}

function disconnect() {
    xrandr --output HDMI-1 --off 
    xrandr --output eDP-1 --auto
    xrdb -merge -I$HOME ~/.Xresources
    nitrogen --restore
}

if [ $(cat /sys/class/drm/card0-HDMI-A-1/status) == "connected" ]; then
    connect
elif [ $(cat /sys/class/drm/card0-HDMI-A-1/status) == "disconnected" ]; then
    disconnect
else
    exit
fi
