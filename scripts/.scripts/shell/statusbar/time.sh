#!/bin/sh

source $HOME/.themes/statusbar_colors.sh

ICON=

printf $ICON_COLOR$ICON$TEXT_COLOR'%s\n' " $(date '+%R')"
