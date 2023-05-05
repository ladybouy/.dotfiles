#!/bin/bash

source $HOME/.themes/statusbar_colors.sh

BG_COLOR="^b"$BLUE_DARK"^"
TEXT_COLOR="^c"$BLACK_DARK"^"
ARROW_COLOR="^c"$BLUE_DARK"^"

echo -e $(curl -s wttr.in/$LOCATION?format=1 | awk -v arrow_color=$ARROW_COLOR -v bg_color=$BG_COLOR -v text_color=$TEXT_COLOR '{ print  arrow_color "\\ue0b2" bg_color text_color " " $1" "$2 }')
