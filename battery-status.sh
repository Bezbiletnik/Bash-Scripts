#!/bin/bash

while true
do
    export DISPLAY=:0.0
    battery_level=`acpi -b | grep -P -o '[0-9]+(?=%)'`
    if cat /sys/class/power_supply/ADP0/online | grep "1"; then
        if [ $battery_level -ge 80 ]; then
            notify-send "Needs to be unplugged!" "Level: ${battery_level}% "
            paplay /usr/share/sounds/freedesktop/stereo/suspend-error.oga
        fi
    else
        if [ $battery_level -le 20 ]; then
            notify-send --urgency=CRITICAL "Battery Low!" "Level: ${battery_level}% "
            paplay /usr/share/sounds/freedesktop/stereo/suspend-error.oga
        fi
    fi
    sleep 30
done

