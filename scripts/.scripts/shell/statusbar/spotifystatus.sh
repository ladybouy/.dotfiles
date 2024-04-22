#!/bin/bash

source $HOME/.themes/statusbar_colors.sh

ICON=""
PLAY_ICON=""
PAUSE_ICON=""
BAR_BG_COLOR="^b"$DARK_BACKGROUND"^"
BG_COLOR="^b"$GREEN_LIGHT"^"
ICON_BG_COLOR="^b"$GREEN_DARK"^"
ICON_COLOR="^c"$BLACK_DARK"^"
TEXT_COLOR="^c"$BLACK_DARK"^"
POWERLINE_COLOR="^c"$GREEN_DARK"^"
POWERLINE_COLOR_2="^c"$GREEN_LIGHT"^"
LEFT_ROUND='\ue0b6'
RIGHT_ROUND='\ue0b4'
LEFT_ARROW='\ue0b2'

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
        echo -e $POWERLINE_COLOR$LEFT_ROUND$ICON_BG_COLOR$TEXT_COLOR$ICON $PLAY_ICON  $BG_COLOR$SPOTIFY_FORMAT$BAR_BG_COLOR$POWERLINE_COLOR_2$RIGHT_ROUND
    elif [[ "$SPOTIFY_STATUS" == "PAUSED" ]]; then
        echo -e $POWERLINE_COLOR$LEFT_ROUND$ICON_BG_COLOR$TEXT_COLOR$ICON $PAUSE_ICON  $BG_COLOR$SPOTIFY_FORMAT$BAR_BG_COLOR$POWERLINE_COLOR_2$RIGHT_ROUND
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
