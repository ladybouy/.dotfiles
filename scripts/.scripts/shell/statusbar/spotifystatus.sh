#!/bin/sh

ICON_COLOR="^c#d79921^"
ICON=""
TEXT_COLOR="^d^"
PLAY_ICON=""
PAUSE_ICON=""

SPOTIFY_FORMAT=$(playerctl --player=spotify metadata --format "{{artist}} - {{title}}")
SPOTIFY_STATUS=$(playerctl status --format "{{ uc(status) }}")
SPOTIFY=$(playerctl --player=spotify)

function spotify_toggle() 
{
    if [[ "$SPOTIFY_STATUS" == "PLAYING" ]]; then
        playerctl --player=spotify pause
    elif [[ "$SPOTIFY_STATUS" == "PAUSED" ]]; then
        playerctl --player=spotify play 
    else
        exit
    fi
}

if [[ "$SPOTIFY_STATUS" == "PLAYING" ]]; then
    echo "$ICON_COLOR $ICON $PLAY_ICON $TEXT_COLOR"$SPOTIFY_FORMAT" "
elif [[ "$SPOTIFY_STATUS" == "PAUSED" ]]; then
    echo "$ICON_COLOR $ICON $PAUSE_ICON $TEXT_COLOR"$SPOTIFY_FORMAT" "
else 
    exit
fi

case $BLOCK_BUTTON in
    1) playerctl --player=spotify previous;;
    2) spotify_toggle;;
    3) playerctl --player=spotify next;;
esac