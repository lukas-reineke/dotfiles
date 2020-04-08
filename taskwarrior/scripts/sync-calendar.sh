#!/bin/bash

cd ~/dev/inthe.am_CalendarSync/
source ./venv-${PWD##*/}/bin/activate
source ./.env.sh
python intheAMsync.py
