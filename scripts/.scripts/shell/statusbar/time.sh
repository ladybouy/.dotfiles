#!/bin/bash

source $HOME/.themes/statusbar_colors.sh

ICON=
BG_COLOR="^b"$RED_DARK"^"
TEXT_COLOR="^c"$BLACK_DARK"^"

echo $BG_COLOR $TEXT_COLOR$ICON "$(date '+%R')" "^d^"
