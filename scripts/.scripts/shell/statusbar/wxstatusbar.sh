#!/bin/bash

source $HOME/.themes/statusbar_colors.sh

BG_COLOR="^b"$BLUE_DARK"^"
TEXT_COLOR="^c"$BLACK_DARK"^"

curl -s wttr.in/$LOCATION?format=1 | awk -v bg_color=$BG_COLOR -v text_color=$TEXT_COLOR '{ print bg_color text_color " " $1" "$2 }'
