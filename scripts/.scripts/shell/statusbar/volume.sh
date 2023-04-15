#!/bin/sh
pacmd list-sinks |
    awk '
        BEGIN {
            ICONsn = "^c#d79921^^c#ebdbb2^ " # headphone unplugged, not muted
            ICONsm = "^c#d79921^婢^c#ebdbb2^ " # headphone unplugged, muted
            ICONhn = "^c#d79921^^c#ebdbb2^ " # headphone plugged in, not muted
            ICONhm = "^c#d79921^^c#ebdbb2^ " # headphone plugged in, muted
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

case $BLOCK_BUTTON in
    1) pactl set-sink-mute @DEFAULT_SINK@ toggle ;;
    3) st -e alsamixer ;;
    4) pactl set-sink-volume @DEFAULT_SINK@ +1% ;;
    5) pactl set-sink-volume @DEFAULT_SINK@ -1% ;;
esac
