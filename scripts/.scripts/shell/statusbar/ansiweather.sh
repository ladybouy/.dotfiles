#!/bin/bash

source $HOME/.themes/statusbar_colors.sh

BG_COLOR="^b"$BLUE_DARK"^"
TEXT_COLOR="^c"$BLUE_DARK"^"
ICON_COLOR="^c"$BLACK_DARK"^"
ARROW_COLOR="^c"$BLUE_DARK"^"

echo -e $BG_COLOR$ICON_COLOR$(ansiweather | awk '{print $7$8 }')  $TEXT_COLOR$(ansiweather | awk '{print $5$6}')

case $BLOCK_BUTTON in
esac
