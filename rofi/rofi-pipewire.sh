#!/bin/bash
set -e

PC_ID=$(wpctl status | grep 'SMSL USB AUDIO Analog Stereo' | sed -n 's/[^0-9]*\([0-9]\+\).*/\1/p')
AIRPODS_ID=$(wpctl status | grep 'AirPods Pro.*\[vol' | sed -n 's/[^0-9]*\([0-9]\+\).*/\1/p')
OUTPUT=$(printf "PC\nAirPods" | rofi -dmenu -i -p "Output")

if [ "$OUTPUT" == "PC" ]; then
    wpctl set-default "$PC_ID"
else
    wpctl set-default "$AIRPODS_ID"
fi
