#!/bin/bash


source $HOME/.themes/statusbar_colors.sh
BAR_BG_COLOR="^b"$DARK_BACKGROUND"^"
ICON_BG_COLOR="^b"$CYAN_DARK"^"
ICON_COLOR="^c"$DARK_BACKGROUND"^"
BG_COLOR="^b"$CYAN_LIGHT"^"
TEXT_COLOR="^c"$DARK_BACKGROUND"^"
ARROW_COLOR="^c"$CYAN_DARK"^"
POWERLINE_COLOR="^c"$CYAN_DARK"^"
POWERLINE_COLOR_2="^c"$CYAN_LIGHT"^"
LEFT_ARROW='\ue0b2'
LEFT_ROUND='\ue0b6'
RIGHT_ROUND='\ue0b4'

echo -e $(pacmd list-sinks |
    awk -v icon_bg_color="$ICON_BG_COLOR" -v icon_color="$ICON_COLOR" -v bg_color="$BG_COLOR" -v text_color="$TEXT_COLOR" -v arrow_color=$ARROW_COLOR -v bar_bg_color="$BAR_BG_COLOR" -v powerline_color=$POWERLINE_COLOR -v powerline_color_2=$POWERLINE_COLOR_2 -v left_round=$LEFT_ROUND -v right_round=$RIGHT_ROUND '
        BEGIN {
            ICONsn =  icon_bg_color icon_color" "  bg_color text_color " "# headphone unplugged, not muted
            ICONsm =  icon_bg_color icon_color"婢 " bg_color text_color " " # headphone unplugged, muted
            ICONhm =  icon_bg_color icon_color"婢 " bg_color text_color " " # headphone plugged in, muted
            ICONhn =  icon_bg_color icon_color" "  bg_color text_color " "# headphone plugged in, not muted
        }
        {
            if (f) {
                if ($1 == "index:") {
                    exit
                }
                if ($1 == "muted:" && $2 == "yes") {
                    m = 1
                } else if ($1 == "volume:") {
                    if ($3 == $10) {
                        vb = $5
                    } else {
                        vl = $5
                        vr = $12
                    }
                } else if ($1 == "active" && $2 == "port:" && $3 ~ /headphone/) {
                    h = 1
                }
            } else if ($1 == "*" && $2 == "index:") {
                f = 1
            }
        }
        END {
            if (f) {
                printf powerline_color
                printf left_round
                printf "%s", h ? (m ? ICONhm : ICONhn) : (m ? ICONsm : ICONsn)
                if (vb) {
                    print vb
                } else {
                    printf "L%s R%s\n", vl, vr
                }
                printf bar_bg_color 
                printf powerline_color_2
                printf right_round
            }
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
