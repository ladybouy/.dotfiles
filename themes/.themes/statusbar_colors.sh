#!/bin/bash

THEME=gruvbox-dark
ICON_COLOR=""
TEXT_COLOR="^d^"

case "$THEME" in
    gruvbox-material-dark)
        ICON_COLOR="^c#d8a657^"
        TEXT_COLOR="^d^"
        ;;
    gruvbox-dark)
        ICON_COLOR="^c#d79921^"
        TEXT_COLOR="^d^"
        ;;
    gruvbox-light)
        ICON_COLOR="^c#98971a^"
        TEXT_COLOR="^d^"
        ;;
    catppuccin-mocha)
        ICON_COLOR="^c#585b70^"
        TEXT_COLOR="^d^"
        ;;
    material-ocean)
        ICON_COLOR="^c#e5e9f0^"
        TEXT_COLOR="^d^"
        ;;
    *)
        echo "$THEME could not be found"
        exit 1
esac
