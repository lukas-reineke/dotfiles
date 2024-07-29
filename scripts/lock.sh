#!/bin/bash

loginctl lock-session &
sleep 1 && systemctl suspend -i
