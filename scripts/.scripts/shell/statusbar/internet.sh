#!/bin/bash

source $HOME/.themes/statusbar_colors.sh

WIFI_UP=
WIFI_DOWN=睊
ETHERNET_UP=
ETHERNET_DOWN=
 
if [[ $(cat /sys/class/net/w*/operstate) == "down" ]] && \
    [[ $(cat /sys/class/net/enp6s0/operstate) == "up" ]]; then
    echo $ICON_COLOR$ETHERNET_UP 
elif [[ $(cat /sys/class/net/w*/operstate) == "up" ]] && \
    [[ $(cat /sys/class/net/enp35s0/operstate) == "up" ]]; then
    echo $ICON_COLOR$ETHERNET_UP 
elif [[ $(cat /sys/class/net/w*/operstate) == "up" ]] && \
    [[ $(cat /sys/class/net/enp6s0/operstate) == "down" ]]; then
    echo $ICON_COLOR$WIFI_UP $TEXT_COLOR$(awk '/^\s*w/ {print int($3 * 100 /70) "%"}' /proc/net/wireless)
else 
    echo $ICON_COLOR$ETHERNET_DOWN$WIFI_DOWN
fi
