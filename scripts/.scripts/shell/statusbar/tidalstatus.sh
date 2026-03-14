#!/bin/bash

# Dependancy music_info

source $HOME/.themes/statusbar_colors.sh

ICON=""
PLAY_ICON=""
PAUSE_ICON=""
BAR_BG_COLOR="^b"$DARK_BACKGROUND"^"
BG_COLOR="^b"$BLACK_DARK"^"
ICON_BG_COLOR="^b"$BLACK_DARK"^"
ICON_COLOR="^c"$WHITE_LIGHT"^"
TEXT_COLOR="^c"$WHITE_LIGHT"^"
POWERLINE_COLOR="^c"$BLACK_DARK"^"
POWERLINE_COLOR_2="^c"$WHITE_LIGHT"^"
LEFT_ROUND='\ue0b6'
RIGHT_ROUND='\ue0b4'
LEFT_ARROW='\ue0b2'

TIDAL_FORMAT=$(playerctl --player=io.github.lullabyX.sone metadata --format "{{artist}} - {{title}}" 2>/dev/null)
TIDAL_STATUS=$(playerctl --player=io.github.lullabyX.sone status --format "{{ uc(status) }}" 2>/dev/null) 
TIDAL=$(playerctl --player=io.github.lullabyX.sone 2>/dev/null)

tidal_toggle() 
{
    if [[ "$TIDAL_STATUS" == "PLAYING" ]]; then
        playerctl --player=io.github.lullabyX.sone pause
    elif [[ "$TIDAL_STATUS" == "PAUSED" ]]; then
        playerctl --player=io.github.lullabyX.sone play 
    else
        exit
    fi
}

tidal_status()
{
    if [[ "$TIDAL_STATUS" == "PLAYING" ]]; then
        echo -e $POWERLINE_COLOR$LEFT_ROUND$ICON_BG_COLOR$TEXT_COLOR$ICON $PLAY_ICON  $BG_COLOR$TIDAL_FORMAT$BAR_BG_COLOR$POWERLINE_COLOR$RIGHT_ROUND
    elif [[ "$TIDAL_STATUS" == "PAUSED" ]]; then
        echo -e $POWERLINE_COLOR$LEFT_ROUND$ICON_BG_COLOR$TEXT_COLOR$ICON $PAUSE_ICON  $BG_COLOR$TIDAL_FORMAT$BAR_BG_COLOR$POWERLINE_COLOR$RIGHT_ROUND
    else 
        exit
    fi
}

tidal_command()
{
    case $1 in
        next)
            playerctl --player=io.github.lullabyX.sone next
            ;;
        previous)
            playerctl --player=io.github.lullabyX.sone previous
            ;;
    esac
}

case $BLOCK_BUTTON in
    1) tidal_toggle;;
    2) tidal_toggle;;
    3) tidal_toggle;;
    4) tidal_command next ;;
    5) tidal_command previous ;;
esac

tidal_status
