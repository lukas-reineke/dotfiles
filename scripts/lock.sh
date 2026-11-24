#!/bin/bash

curl -X POST http://hiroshi.local:8123/api/webhook/turn_office_off
loginctl lock-session &
sleep 1 && systemctl suspend -i
