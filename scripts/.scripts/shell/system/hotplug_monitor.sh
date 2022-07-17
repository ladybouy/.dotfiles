#!/bin/bash

export DISPLAY=:0 
export XAUTHORITY=/home/$(whoami)/.Xauthority

function connect() {
    xrandr --output HDMI-1 --off
    xrandr --output HDMI-1 --auto
    xrandr --output HDMI-1 --same-as eDP-1
}

function disconnect() {
    xrandr --output HDMI-1 --off 
}

if [ $(cat /sys/class/drm/card0-HDMI-A-1/status) == "connected" ]; then
    connect
elif [ $(cat /sys/class/drm/card0-HDMI-A-1/status) == "disconnected" ]; then
    disconnect
else
    exit
fi
