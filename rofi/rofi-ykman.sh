#!/bin/bash
set -e

# update accounts with `ykman oath accounts list > ~/.ykman-oath-accounts`
ACCOUNT=$(rofi -dmenu -i -p "TOTP" <~/.ykman-oath-accounts)

TOTP=$(ykman oath accounts code "$ACCOUNT" | awk -F'  ' '{print $2}')

if [ -n "$WAYLAND_DISPLAY" ]; then
    wtype "$TOTP"
else
    xdotool type "$TOTP"
fi
