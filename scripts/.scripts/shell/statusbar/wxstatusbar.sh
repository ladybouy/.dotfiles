#!/bin/bash

source $HOME/.themes/statusbar_colors.sh

curl -s -f wttr.in/$LOCATION?format=1 | awk -v icon_color=$ICON_COLOR -v text_color=$TEXT_COLOR '{ print icon_color$1 " "text_color$2 }'
