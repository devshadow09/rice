#!/bin/bash

case $BLOCK_BUTTON in
    1) playerctl play-pause ;;     # left click
    3) playerctl loop Track ;;          # right click
    5) playerctl previous ;;       # scroll up
    4) playerctl next ;;           # scroll down
esac

# Fetch player status
status=$(playerctl status 2>/dev/null)

# Fetch artist and title
artist=$(playerctl metadata artist 2>/dev/null)
title=$(playerctl metadata title 2>/dev/null)

# Trim title if it's too long
short_title=$(echo "$title" | cut -c1-20)
if [ ${#title} -gt 20 ]; then
    short_title="$short_title..."
fi

# Set icon based on playback status
if [[ "$status" == "Playing" ]]; then
    icon=""
elif [[ "$status" == "Paused" ]]; then
    icon=""
else
    icon=""
fi

# Output the formatted result
echo "$icon $artist - $short_title"

