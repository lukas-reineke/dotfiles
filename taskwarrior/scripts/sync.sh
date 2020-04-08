#!/bin/bash

set -e

curl 'https://inthe.am/api/v2/tasks/trello/resynchronize/' -X POST -H 'Origin:
https://inthe.am' -H "Authorization: Token $INTHE_TOKEN"
bugwarrior-pull
python ~/dotfiles/taskwarrior/scripts/update-tasks.py
task sync
~/dotfiles/taskwarrior/scripts/sync-calendar.sh
