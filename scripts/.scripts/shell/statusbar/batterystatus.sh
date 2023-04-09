#!/bin/sh

ICON_COLOR="^c#d79921^"
TEXT_COLOR="^d^"

for battery in /sys/class/power_supply/BAT?*; do
    # If non-first battery, print a space separator.
    [ -n "${capacity+x}" ] && printf " "

    capacity="$(cat "$battery/capacity" 2>&1)"
    if [ "$capacity" -gt 90 ]; then
        status=" "
    elif [ "$capacity" -gt 60 ]; then
        status=" "
    elif [ "$capacity" -gt 40 ]; then
        status=" "
    elif [ "$capacity" -gt 10 ]; then
        status=" "
    else
        status=" "
    fi

    # Sets up the status and capacity
    case "$(cat "$battery/status" 2>&1)" in
        Full) status=" " ;;
        Discharging)
            if [ "$capacity" -le 20 ]; then
                status="$status"
                color=1
            fi
            ;;
        Charging) status="ﮣ$status" ;;
        "Not charging") status="屢 " ;;
        Unknown) status=" $status" ;;
        *) exit 1 ;;
    esac

    # Prints the info
    echo $ICON_COLOR$status$TEXT_COLOR$capacity%
done && echo
