#!/bin/bash

THEME=catppuccin-mocha
ICON_COLOR=""
TEXT_COLOR="^d^"

case "$THEME" in
    gruvbox-material-dark)
        source $HOME/.themes/status-bar-colors/gruvbox_material_dark.sh
        ;;
    gruvbox-dark)
        source $HOME/.themes/status-bar-colors/gruvbox_dark.sh
        ;;
    gruvbox-light)
        source $HOME/.themes/status-bar-colors/gruvbox_light.sh
        ;;
    catppuccin-mocha)
        source $HOME/.themes/status-bar-colors/catppuccin_mocha.sh
        ;;
    material-ocean)
        source $HOME/.themes/status-bar-colors/material_ocean.sh
        ;;
    *)
        echo "$THEME could not be found"
        exit 1
esac
