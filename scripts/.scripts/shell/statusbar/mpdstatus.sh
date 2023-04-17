#!/bin/bash

source $HOME/.themes/statusbar_colors.sh

MUSIC_ICON="ﱘ"
PLAY_ICON=""
PAUSE_ICON=""

MPC_FORMAT=$(mpc --format [[%artist%" "-" "]%title%] | head -n 1)
MPC_STATUS=$(mpc --format %title% | awk 'NR==2 {print $1}')

if [[ "$MPC_STATUS" == "[playing]" ]]; then
    echo "$ICON_COLOR$PLAY_ICON $TEXT_COLOR "$MPC_FORMAT" "
elif [[ "$MPC_STATUS" == "[paused]" ]]; then
    echo "$ICON_COLOR$PAUSE_ICON $TEXT_COLOR "$MPC_FORMAT" "
else 
    exit
fi

case $BLOCK_BUTTON in
    1) mpc toggle ;;
    3) st -e ncmpcpp ;;
esac
