#!/bin/bash

source $HOME/.themes/statusbar_colors.sh

MUSIC_ICON="ﱘ"
PLAY_ICON=""
PAUSE_ICON=""
BG_COLOR="^b"$BLACK_DARK"^"
TEXT_COLOR="^c"$WHITE_DARK"^"

MPC_FORMAT=$(mpc --format [[%artist%" "-" "]%title%] | head -n 1)
MPC_STATUS=$(mpc --format %title% | awk 'NR==2 {print $1}')

if [[ "$MPC_STATUS" == "[playing]" ]]; then
    echo "$BG_COLOR $TEXT_COLOR$MUSIC_ICON $PLAY_ICON "$MPC_FORMAT" "
elif [[ "$MPC_STATUS" == "[paused]" ]]; then
    echo "$BG_COLOR $TEXT_COLOR$MUSIC_ICON $PAUSE_ICON "$MPC_FORMAT" "
else 
    exit
fi

case $BLOCK_BUTTON in
    1) mpc toggle ;;
    3) st -e ncmpcpp ;;
esac
