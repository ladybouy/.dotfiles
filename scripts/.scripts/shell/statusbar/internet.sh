#!/bin/bash

source $HOME/.themes/statusbar_colors.sh

WIFI_UP=
WIFI_DOWN=睊
ETHERNET_UP=
ETHERNET_DOWN=
ICON_BG_COLOR="^b"$YELLOW_DARK"^"
BAR_BG_COLOR="^b"$DARK_BACKGROUND"^"
BG_COLOR="^b"$YELLOW_DARK"^"
ICON_COLOR="^c"$BLACK_DARK"^"
TEXT_COLOR="^c"$DARK_BACKGROUND"^"
ARROW_COLOR="^c"$YELLOW_DARK"^"
POWERLINE_COLOR="^c"$YELLOW_DARK"^"
POWERLINE_COLOR_2="^c"$YELLOW_LIGHT"^"
LEFT_ARROW='\ue0b2'
LEFT_ROUND='\ue0b6'
RIGHT_ROUND='\ue0b4'
ARROW='\ue0b2'

if [[ $(cat /sys/class/net/w*/operstate) == "down" ]] && \
    [[ $(cat /sys/class/net/enp6s0/operstate) == "up" ]]; then
    echo -e $POWERLINE_COLOR$LEFT_ROUND$ICON_BG_COLOR$ICON_COLOR$ETHERNET_UP $BAR_BG_COLOR$POWERLINE_COLOR$RIGHT_ROUND
elif [[ $(cat /sys/class/net/w*/operstate) == "up" ]] && \
    [[ $(cat /sys/class/net/enp35s0/operstate) == "up" ]]; then
    echo -e $POWERLINE_COLOR$LEFT_ROUND$ICON_BG_COLOR$ICON_COLOR$ETHERNET_UP $BAR_BG_COLOR$POWERLINE_COLOR$RIGHT_ROUND
elif [[ $(cat /sys/class/net/w*/operstate) == "up" ]] && \
    [[ $(cat /sys/class/net/enp6s0/operstate) == "down" ]]; then
    echo -e $POWERLINE_COLOR$LEFT_ROUND$ICON_BG_COLOR$ICON_COLOR$WIFI_UP $TEXT_COLOR $(awk '/^\s*w/ {print int($3 * 100 /70) "%"}' /proc/net/wireless) $BAR_BG_COLOR$POWERLINE_COLOR$RIGHT_ROUND
else 
    echo -e $POWERLINE_COLOR$LEFT_ROUND$ICON_BG_COLOR$ICON_COLOR$ETHERNET_DOWN$WIFI_DOWN $BAR_BG_COLOR$POWERLINE_COLOR$RIGHT_ROUND
fi

case $BLOCK_BUTTON in
esac
