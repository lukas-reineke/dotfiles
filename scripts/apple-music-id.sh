#!/bin/bash

for player in $(playerctl -l); do
    if [[ $player == firefox* ]]; then
        if playerctl -p "$player" metadata xesam:url 2>/dev/null | grep -q "music.apple.com"; then
            echo "$player"
            exit 0
        fi
    fi
done
