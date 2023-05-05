#!/bin/bash

source $HOME/.themes/statusbar_colors.sh

WIFI_UP=
WIFI_DOWN=睊
ETHERNET_UP=
ETHERNET_DOWN=
BG_COLOR="^b"$YELLOW_DARK"^"
TEXT_COLOR="^c"$BLACK_DARK"^"

if [[ $(cat /sys/class/net/w*/operstate) == "down" ]] && \
    [[ $(cat /sys/class/net/enp6s0/operstate) == "up" ]]; then
    echo $BG_COLOR $TEXT_COLOR$ETHERNET_UP
elif [[ $(cat /sys/class/net/w*/operstate) == "up" ]] && \
    [[ $(cat /sys/class/net/enp35s0/operstate) == "up" ]]; then
    echo $BG_COLOR $TEXT_COLOR$ETHERNET_UP
elif [[ $(cat /sys/class/net/w*/operstate) == "up" ]] && \
    [[ $(cat /sys/class/net/enp6s0/operstate) == "down" ]]; then
    echo $BG_COLOR $TEXT_COLOR$WIFI_UP $(awk '/^\s*w/ {print int($3 * 100 /70) "%"}' /proc/net/wireless)
else 
    echo $BG_COLOR $TEXT_COLOR$ETHERNET_DOWN$WIFI_DOWN
fi
