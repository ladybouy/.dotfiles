#!/bin/bash

source $HOME/.themes/statusbar_colors.sh

MUSIC_ICON="ﱘ"
PLAY_ICON=""
PAUSE_ICON=""
BAR_BG_COLOR="^b"$DARK_BACKGROUND"^"
BG_COLOR="^b"$WHITE_DARK"^"
ICON_BG_COLOR="^b"$WHITE_DARK"^"
ICON_COLOR="^c"$BLACK_DARK"^"
TEXT_COLOR="^c"$BLACK_DARK"^"
POWERLINE_COLOR="^c"$WHITE_DARK"^"
POWERLINE_COLOR_2="^c"$WHITE_LIGHT"^"
LEFT_ROUND='\ue0b6'
RIGHT_ROUND='\ue0b4'
LEFT_ARROW='\ue0b2'


# MPD_FORMAT=$(mpd --format [[%artist%" "-" "]%title%] | head -n 1)
# MPD_STATUS=$(mpd --format %title% | awk 'NR==2 {print $1}')

mpd_up()
{
    while : ; do
        mpd idle >/dev/null && kill -45 "$(pidof dwmblocks)" || break
    done
}

pidof -x mpd_up >/dev/null 2>&1 || mpd_up >/dev/null 2>&1 &

# if [[ "$MPD_STATUS" == "[playing]" ]]; then
#     echo -e $POWERLINE_COLOR$LEFT_ROUND$ICON_BG_COLOR$TEXT_COLOR$MUSIC_ICON $PLAY_ICON $BG_COLOR" $MPD_FORMAT"$BAR_BG_COLOR$POWERLINE_COLOR$RIGHT_ROUND
# elif [[ "$MPD_STATUS" == "[paused]" ]]; then
#     echo -e $POWERLINE_COLOR$LEFT_ROUND$ICON_BG_COLOR$TEXT_COLOR$MUSIC_ICON $PAUSE_ICON $BG_COLOR" $MPD_FORMAT"$BAR_BG_COLOR$POWERLINE_COLOR$RIGHT_ROUND
# else 
#     exit
# fi
 
MPD_FORMAT=$(playerctl --player=mpd metadata --format "{{artist}} - {{title}}" 2>/dev/null)
MPD_STATUS=$(playerctl --player=mpd status --format "{{ uc(status) }}" 2>/dev/null) 
 

mpd_toggle() 
{
    if [[ "$MPD_STATUS" == "PLAYING" ]]; then
        playerctl --player=mpd pause
    elif [[ "$MPD_STATUS" == "PAUSED" ]]; then
        playerctl --player=mpd play 
    else
        exit
    fi
}


mpd_status()
{
    if [[ "$MPD_STATUS" == "PLAYING" ]]; then
        echo -e $POWERLINE_COLOR$LEFT_ROUND$ICON_BG_COLOR$TEXT_COLOR$ICON $PLAY_ICON  $BG_COLOR$MPD_FORMAT$BAR_BG_COLOR$POWERLINE_COLOR$RIGHT_ROUND
    elif [[ "$MPD_STATUS" == "PAUSED" ]]; then
        echo -e $POWERLINE_COLOR$LEFT_ROUND$ICON_BG_COLOR$TEXT_COLOR$ICON $PAUSE_ICON  $BG_COLOR$MPD_FORMAT$BAR_BG_COLOR$POWERLINE_COLOR$RIGHT_ROUND
    else 
        exit
    fi
}

mpd_command()
{
    case $1 in
        next)
            playerctl --player=mpd next
            ;;
        previous)
            playerctl --player=mpd previous
            ;;
    esac

#    music_info mpd
}


case $BLOCK_BUTTON in
    1) mpd_toggle ;;
    2) mpd_toggle ;;
    3) st -e ncmpdpp ;;
    4) mpd_command next ;;
    5) mpd_command previous ;;

esac

mpd_status
