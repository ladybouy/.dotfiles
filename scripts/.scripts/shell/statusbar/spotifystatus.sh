#!/bin/bash

source $HOME/.themes/statusbar_colors.sh

ICON=""
PLAY_ICON=""
PAUSE_ICON=""
BG_COLOR="^b"$GREEN_DARK"^"
TEXT_COLOR="^c"$BLACK_DARK"^"

SPOTIFY_FORMAT=$(playerctl --player=spotify metadata --format "{{artist}} - {{title}}" 2>/dev/null)
SPOTIFY_STATUS=$(playerctl --player=spotify status --format "{{ uc(status) }}" 2>/dev/null) 
SPOTIFY=$(playerctl --player=spotify 2>/dev/null)

spotify_toggle() 
{
    if [[ "$SPOTIFY_STATUS" == "PLAYING" ]]; then
        playerctl --player=spotify pause
    elif [[ "$SPOTIFY_STATUS" == "PAUSED" ]]; then
        playerctl --player=spotify play 
    else
        exit
    fi
}

spotify_status()
{
    if [[ "$SPOTIFY_STATUS" == "PLAYING" ]]; then
        echo $BG_COLOR $TEXT_COLOR$ICON $PLAY_ICON $SPOTIFY_FORMAT "^d^"
    elif [[ "$SPOTIFY_STATUS" == "PAUSED" ]]; then
        echo $BG_COLOR $TEXT_COLOR$ICON $PAUSE_ICON $SPOTIFY_FORMAT "^d^"
    else 
        exit
    fi
}

case $BLOCK_BUTTON in
    1) playerctl --player=spotify previous;;
    2) spotify_toggle;;
    3) playerctl --player=spotify next;;
esac

spotify_status
