#!/bin/bash

source $HOME/.themes/statusbar_colors.sh

MUSIC_ICON="ﱘ"
PLAY_ICON=""
PAUSE_ICON=""
BAR_BG_COLOR="^b"$DARK_BACKGROUND"^"
BG_COLOR="^b"$WHITE_DARK"^"
ICON_BG_COLOR="^b"$WHITE_DARK"^"
ICON_COLOR="^c"$BLACK_DARK"^"
TEXT_COLOR="^c"$BLACK_DARK"^"
POWERLINE_COLOR="^c"$WHITE_DARK"^"
POWERLINE_COLOR_2="^c"$WHITE_DARK"^"
LEFT_ROUND='\ue0b6'
RIGHT_ROUND='\ue0b4'
LEFT_ARROW='\ue0b2'

MPC_FORMAT=$(mpc --format [[%artist%" "-" "]%title%] | head -n 1)
MPC_STATUS=$(mpc --format %title% | awk 'NR==2 {print $1}')

if [[ "$MPC_STATUS" == "[playing]" ]]; then
    echo -e $POWERLINE_COLOR$LEFT_ROUND$ICON_BG_COLOR$TEXT_COLOR$MUSIC_ICON $PLAY_ICON $BG_COLOR" $MPC_FORMAT"$BAR_BG_COLOR$POWERLINE_COLOR_2$RIGHT_ROUND
elif [[ "$MPC_STATUS" == "[paused]" ]]; then
    echo -e $POWERLINE_COLOR$LEFT_ROUND$ICON_BG_COLOR$TEXT_COLOR$MUSIC_ICON $PAUSE_ICON $BG_COLOR" $MPC_FORMAT"$BAR_BG_COLOR$POWERLINE_COLOR_2$RIGHT_ROUND
else 
    exit
fi

case $BLOCK_BUTTON in
    1) mpc toggle ;;
    3) st -e ncmpcpp ;;
esac
