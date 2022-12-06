#!/usr/bin/env bash

# Runs a color picker which copies its outputted hex color to the clipboard.
# The if/else here then sends a dunst notification with the color as its background,
# and either a light or dark color on the text to contrast the background.

xcolor -s

CLR=$(xclip -o -sel clip)

# Rough check of lightness. If the hex is comprised entirely of numbers it is likely dark and needs light text.
re='^#[a-fA-F]+'
if ! [[ $CLR =~ $re ]]; then
    notify-send -h "string:bgcolor:$CLR" -h "string:fgcolor:#eeeeee" $CLR
else
    notify-send -h "string:bgcolor:$CLR" -h "string:fgcolor:#333333" $CLR
fi

