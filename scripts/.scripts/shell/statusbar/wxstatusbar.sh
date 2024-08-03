#!/bin/bash

source $HOME/.themes/statusbar_colors.sh

ICON_BG_COLOR="^b"$BLUE_DARK"^"
BAR_BG_COLOR="^b"$DARK_BACKGROUND"^"
BG_COLOR="^b"$BLUE_DARK"^"
ICON_BG_COLOR="^b"$BLUE_DARK"^"
ICON_COLOR="^c"$BLACK_DARK"^"
TEXT_COLOR="^c"$BLACK_DARK"^"
POWERLINE_COLOR="^c"$BLUE_DARK"^"
LEFT_ROUND='\ue0b6'
RIGHT_ROUND='\ue0b4'

echo -e $(curl -s wttr.in/$LOCATION?format=1 | awk -v arrow_color=$ARROW_COLOR -v powerline_color=$POWERLINE_COLOR -v bar_bg_color=$BAR_BG_COLOR -v bg_color=$BG_COLOR -v icon_color=$ICON_COLOR -v text_color=$TEXT_COLOR -v left_round=$LEFT_ROUND -v right_round=$RIGHT_ROUND '{ print powerline_color left_round bg_color text_color $1" " $2 bar_bg_color powerline_color right_round}')
