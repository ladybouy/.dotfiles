#!/bin/bash

source $HOME/.themes/statusbar_colors.sh

ICON=
BG_COLOR="^b"$RED_DARK"^"
TEXT_COLOR="^c"$BLACK_DARK"^"
ARROW_COLOR="^c"$RED_DARK"^"

echo -e $ARROW_COLOR'\ue0b2'$BG_COLOR $TEXT_COLOR$ICON "$(date '+%R')" "^d^"
