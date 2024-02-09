#!/bin/bash


source $HOME/.themes/statusbar_colors.sh
BG_COLOR="^b"$CYAN_DARK"^"
TEXT_COLOR="^c"$BLACK_DARK"^"
ARROW_COLOR="^c"$CYAN_DARK"^"

echo -e $(wpctl get-volume @DEFAULT_AUDIO_SINK@ | 
    awk -v bg_color="$BG_COLOR" -v text_color="$TEXT_COLOR" -v arrow_color=$ARROW_COLOR '
        BEGIN {
            ICONsn = arrow_color "\\ue0b2" bg_color " " text_color" "  # headphone unplugged, not muted
            ICONsm = arrow_color "\\ue0b2" bg_color " " text_color"婢 "  # headphone unplugged, muted
            ICONhn = arrow_color "\\ue0b2" bg_color " " text_color" "  # headphone plugged in, not muted
            ICONhm = arrow_color "\\ue0b2" bg_color " " text_color"婢 "  # headphone plugged in, muted
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
            printf "%s", h ? (m ? ICONhm : ICONhn) : (m ? ICONsm : ICONsn)
            printf volume"%"
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
