#!/bin/bash

killall -SIGUSR1 dunst && i3lock -c 000000 -e --nofork && killall -SIGUSR2 dunst
