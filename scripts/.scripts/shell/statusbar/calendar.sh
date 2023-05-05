#!/bin/bash

source $HOME/.themes/statusbar_colors.sh

ICON=
BG_COLOR="^b"$WHITE_LIGHT"^"
TEXT_COLOR="^c"$BLACK_DARK"^"

echo $BG_COLOR $TEXT_COLOR$ICON "$(date '+%d %B %Y')"

case $BLOCK_BUTTON in
    1) st -e calcurse;;
esac
