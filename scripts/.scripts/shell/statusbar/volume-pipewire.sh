#!/bin/bash


source $HOME/.themes/statusbar_colors.sh
BAR_BG_COLOR="^b"$DARK_BACKGROUND"^"
ICON_BG_COLOR="^b"$CYAN_DARK"^"
ICON_COLOR="^c"$DARK_BACKGROUND"^"
BG_COLOR="^b"$CYAN_DARK"^"
TEXT_COLOR="^c"$DARK_BACKGROUND"^"
ARROW_COLOR="^c"$CYAN_DARK"^"
POWERLINE_COLOR="^c"$CYAN_DARK"^"
POWERLINE_COLOR_2="^c"$CYAN_LIGHT"^"
LEFT_ARROW='\ue0b2'
LEFT_ROUND='\ue0b6'
RIGHT_ROUND='\ue0b4'

echo -e $(wpctl get-volume @DEFAULT_AUDIO_SINK@ | 
    awk -v icon_bg_color="$ICON_BG_COLOR" -v icon_color="$ICON_COLOR" -v bg_color="$BG_COLOR" -v text_color="$TEXT_COLOR" -v arrow_color=$ARROW_COLOR -v bar_bg_color="$BAR_BG_COLOR" -v powerline_color=$POWERLINE_COLOR -v powerline_color_2=$POWERLINE_COLOR_2 -v left_round=$LEFT_ROUND -v right_round=$RIGHT_ROUND '
        BEGIN {
            ICONsn =  icon_bg_color icon_color""  bg_color text_color " "# headphone unplugged, not muted
            ICONsm =  icon_bg_color icon_color"婢" bg_color text_color " " # headphone unplugged, muted
            ICONhn =  icon_bg_color icon_color""  bg_color text_color " "# headphone plugged in, not muted
            ICONhm =  icon_bg_color icon_color"婢" bg_color text_color " " # headphone plugged in, muted
        }
        {
            if ($NF == "[MUTED]") {
                m = 1 
                volume = $2 * 100
            } else {
                volume = $NF * 100
            }
        }
        END {
            printf powerline_color
            printf left_round
            printf "%s",h ? (m ? ICONhm : ICONhn) : (m ? ICONsm : ICONsn)
            printf volume"%"
            printf bar_bg_color 
            printf powerline_color
            printf right_round
        }
        '
)

case $BLOCK_BUTTON in
    1) pactl set-sink-mute @DEFAULT_SINK@ toggle ;;
    2) pavucontrol ;;
    3) st -e alsamixer ;;
    4) pactl set-sink-volume @DEFAULT_SINK@ +1% ;;
    5) pactl set-sink-volume @DEFAULT_SINK@ -1% ;;
esac
