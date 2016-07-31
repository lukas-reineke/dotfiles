#!/bin/bash

SPOTIFY=`ps aux | grep spotify | grep -v grep`

if [ "$SPOTIFY" ]; then
    playerctl play-pause
else
    spotify
fi
