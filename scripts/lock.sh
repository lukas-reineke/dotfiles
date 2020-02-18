#!/bin/bash

killall -SIGUSR1 dunst && i3lock -c 1f1f1f -e --nofork && killall -SIGUSR2 dunst
