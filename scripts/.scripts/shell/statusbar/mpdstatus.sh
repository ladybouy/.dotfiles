#!/bin/bash

MUSIC_ICON="^c#d79921^"ﱘ
FONT_COLOR="^c#ebdbb2^"
PLAY_ICON="^c#d79921^"
PAUSE_ICON="^c#d79921^"

MPC_FORMAT=$(mpc --format [[%artist%" "-" "]%title%] | head -n 1)
MPC_STATUS=$(mpc --format %title% | awk 'NR==2 {print $1}')

if [[ "$MPC_STATUS" == "[playing]" ]]; then
    echo "$PLAY_ICON $FONT_COLOR "$MPC_FORMAT" "
elif [[ "$MPC_STATUS" == "[paused]" ]]; then
    echo "$PAUSE_ICON $FONT_COLOR "$MPC_FORMAT" "
else 
    exit
fi

case $BLOCK_BUTTON in
    1) mpc toggle ;;
    3) st -e ncmpcpp ;;
esac
