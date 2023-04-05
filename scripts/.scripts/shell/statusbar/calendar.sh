#!/bin/sh

ICON=
ICON_COLOR="^c#d79921^"
TEXT_COLOR="^c#ebdbb2^"

printf $ICON_COLOR$ICON$TEXT_COLOR'%s\n' " $(date '+%d %B %Y')"

case $BLOCK_BUTTON in
    1) st -e calcurse;;
esac
