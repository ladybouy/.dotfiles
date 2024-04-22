#!/bin/bash

source $HOME/.themes/statusbar_colors.sh

ICON_BG_COLOR="^b"$BLUE_DARK"^"
BG_COLOR="^b"$DARK_BACKGROUND"^"
ICON_COLOR="^c"$BLACK_DARK"^"
TEXT_COLOR="^c"$BLUE_DARK"^"

echo -e $(curl -s wttr.in/$LOCATION?format=1 | awk -v arrow_color=$ARROW_COLOR -v icon_bg_color=$ICON_BG_COLOR -v bg_color=$BG_COLOR -v icon_color=$ICON_COLOR -v text_color=$TEXT_COLOR '{ print  icon_bg_color icon_color " "$1" " bg_color text_color " "$2 }')
