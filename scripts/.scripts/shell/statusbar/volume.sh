#!/bin/bash


source $HOME/.themes/statusbar_colors.sh
BG_COLOR="^b"$CYAN_DARK"^"
TEXT_COLOR="^c"$BLACK_DARK"^"
ARROW_COLOR="^c"$CYAN_DARK"^"

echo -e $(pacmd list-sinks |
    awk -v bg_color="$BG_COLOR" -v text_color="$TEXT_COLOR" -v arrow_color=$ARROW_COLOR '
        BEGIN {
            ICONsn = arrow_color "\\ue0b2" bg_color " " text_color" "  # headphone unplugged, not muted
            ICONsm = arrow_color "\\ue0b2 "bg_color " " text_color"婢 "  # headphone unplugged, muted
            ICONhn = arrow_color "\\ue0b2 "bg_color " " text_color" "  # headphone plugged in, not muted
            ICONhm = arrow_color "\\ue0b2 "bg_color " " text_color"婢 "  # headphone plugged in, muted
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
                printf "%s", h ? (m ? ICONhm : ICONhn) : (m ? ICONsm : ICONsn)
                if (vb) {
                    print vb
                } else {
                    printf "L%s R%s\n", vl, vr
                }
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
