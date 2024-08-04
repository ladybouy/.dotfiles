#!/bin/bash

source $HOME/.themes/statusbar_colors.sh

WIFI_UP=
WIFI_DOWN=睊
ETHERNET_UP=
ETHERNET_DOWN=
BAR_BG_COLOR="^b"$DARK_BACKGROUND"^"
BG_COLOR="^b"$YELLOW_LIGHT"^"
TEXT_COLOR="^c"$DARK_BACKGROUND"^"
ICON_BG_COLOR="^b"$YELLOW_DARK"^"
ICON_COLOR="^c"$DARK_BACKGROUND"^"
POWERLINE_COLOR="^c"$YELLOW_DARK"^"
POWERLINE_COLOR_2="^c"$YELLOW_LIGHT"^"
LEFT_ARROW='\ue0b2'
LEFT_ROUND='\ue0b6'
RIGHT_ROUND='\ue0b4'

if [[ $(cat /sys/class/net/w*/operstate) == "down" ]] && \
    [[ $(cat /sys/class/net/enp35s0/operstate) == "up" ]]; then
    echo -e $POWERLINE_COLOR$LEFT_ROUND$ICON_BG_COLOR$ICON_COLOR$TEXT_COLOR$ETHERNET_UP $BAR_BG_COLOR$POWERLINE_COLOR$RIGHT_ROUND 
elif [[ $(cat /sys/class/net/w*/operstate) == "up" ]] && \
    [[ $(cat /sys/class/net/enp35s0/operstate) == "up" ]]; then
    echo -e $POWERLINE_COLOR$LEFT_ROUND$ICON_BG_COLOR$ICON_COLOR$TEXT_COLOR$ETHERNET_UP $BAR_BG_COLOR$POWERLINE_COLOR$RIGHT_ROUND 
elif [[ $(cat /sys/class/net/w*/operstate) == "up" ]] && \
    [[ $(cat /sys/class/net/enp35s0/operstate) == "down" ]]; then
    echo -e $POWERLINE_COLOR$LEFT_ROUND$ICON_BG_COLOR$ICON_COLOR$TEXT_COLOR$WIFI_UP $(awk '/^\s*w/ {print int($3 * 100 /70) "%"}' /proc/net/wireless) $BAR_BG_COLOR$POWERLINE_COLOR$RIGHT_ROUND 
else 
    echo -e $POWERLINE_COLOR$LEFT_ROUND$BG_COLOR  $TEXT_COLOR$ETHERNET_DOWN$WIFI_DOWN $BAR_BG_COLOR$POWERLINE_COLOR$RIGHT_ROUND 
fi
