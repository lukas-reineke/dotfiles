#!/bin/bash

cat ~/.bookmarks  | sed -n "s/.* : \(.*\)$/\1/p" | sed "s#~#$HOME#"

