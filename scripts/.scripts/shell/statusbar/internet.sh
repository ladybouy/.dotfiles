#!/bin/bash

WIFI_UP=
WIFI_DOWN=睊
ETHERNET_UP=
ETHERNET_DOWN=
COLOR_ICON="^c#d79921^"
COLOR_TEXT="^c#ebdbb2^"
 
if [[ $(cat /sys/class/net/w*/operstate) == "down" ]] && \
    [[ $(cat /sys/class/net/enp6s0/operstate) == "up" ]]; then
    echo $COLOR_ICON$ETHERNET_UP 
elif [[ $(cat /sys/class/net/w*/operstate) == "up" ]] && \
    [[ $(cat /sys/class/net/enp6s0/operstate) == "up" ]]; then
    echo $COLOR_ICON$ETHERNET_UP 
elif [[ $(cat /sys/class/net/w*/operstate) == "up" ]] && \
    [[ $(cat /sys/class/net/enp6s0/operstate) == "down" ]]; then
    echo $COLOR_ICON$WIFI_UP $COLOR_TEXT$(awk '/^\s*w/ {print int($3 * 100 /70) "%"}' /proc/net/wireless)
else 
    echo $COLOR_ICON$ETHERNET_DOWN$WIFI_DOWN
fi
