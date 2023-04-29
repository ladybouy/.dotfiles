#!/bin/bash

source $HOME/.themes/statusbar_colors.sh

ICON=

printf $ICON_COLOR$ICON$TEXT_COLOR'%s\n' " $(date '+%d %B %Y')"

case $BLOCK_BUTTON in
    1) st -e calcurse;;
esac
