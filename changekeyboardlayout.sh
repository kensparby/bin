#!/usr/bin/env sh

# Switches between two keyboard given layouts, in this case between US English and Norwegian.
# This is called from a key combination in `sxhkd` that is triggered from a layer on my QMK keyboard.

CURR=$(setxkbmap -query | grep "layout" | cut -f6 -d ' ')

if [[ $CURR = 'no' ]]; then
    setxkbmap us;
    dunstify "Changed to US ENGLISH layout." -r 9;
else
    setxkbmap no;
    dunstify "Changed to NORWEGIAN layout." -r 9;
fi
