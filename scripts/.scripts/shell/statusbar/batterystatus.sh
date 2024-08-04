#!/bin/bash

source $HOME/.themes/statusbar_colors.sh

BAR_BG_COLOR="^b"$DARK_BACKGROUND"^"
BG_COLOR="^b"$RED_LIGHT"^"
TEXT_COLOR="^c"$DARK_BACKGROUND"^"
ICON_BG_COLOR="^b"$RED_DARK"^"
ICON_COLOR="^c"$DARK_BACKGROUND"^"
POWERLINE_COLOR="^c"$RED_DARK"^"
POWERLINE_COLOR_2="^c"$RED_LIGHT"^"
LEFT_ARROW='\ue0b2'
LEFT_ROUND='\ue0b6'
RIGHT_ROUND='\ue0b4'

function battery_remaining()
{
    current_now=$(cat /sys/class/power_supply/BAT0/current_now)
    charge_now=$(cat /sys/class/power_supply/BAT0/charge_now)
    time_left=$(awk -v current=$current_now -v charge=$charge_now 'BEGIN {time = charge / current; print time}')
    hours=$(awk -v hour=$time_left 'BEGIN {print int(hour)}')
    minutes=$(awk -v hour=$hours -v time=$time_left 'BEGIN {print int((time - hour) * 60)}')
    echo $hours"h" $minutes"m"
}

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
        Charging) status="ﮣ $status" ;;
        "Not charging") status="屢 " ;;
        Unknown) status="  $status" ;;
        *) exit 1 ;;
    esac

    if [[ "$(cat "$battery/status" 2>&1)" == "Discharging" ]]; then
        time_remaining=$(acpi | awk '{print $5}')
        echo -e  $POWERLINE_COLOR$LEFT_ROUND$ICON_BG_COLOR$ICON_COLOR$status$capacity%  $(battery_remaining)$BAR_BG_COLOR$POWERLINE_COLOR$RIGHT_ROUND
    else
        echo -e $POWERLINE_COLOR$LEFT_ROUND$ICON_BG_COLOR$ICON_COLOR$status$TEXT_COLOR$capacity%$BAR_BG_COLOR$POWERLINE_COLOR$RIGHT_ROUND 
    fi

    # Prints the info
done && echo
