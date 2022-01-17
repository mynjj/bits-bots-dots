#!/usr/bin/bash

# Simple feh script to randomly set a wallpaper with `feh`

WALLPAPERS_DIR="$HOME/refs/wallpapers"
REFRESH_TIME=80

set -e # exit with any failure

cd $WALLPAPERS_DIR

while true
do
	ls | sort -R | head -n 1 | xargs feh --bg-fill
	sleep $REFRESH_TIME
done
