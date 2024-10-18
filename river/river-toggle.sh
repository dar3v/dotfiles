#!/bin/sh
# This shell script is PUBLIC DOMAIN. You may do whatever you want with it.

TOGGLE=$HOME/.config/river/.toggle

if [ ! -e $TOGGLE ]; then
  touch $TOGGLE
  riverctl rule-add -app-id '*' float
  notify-send "river" "Floating Mode"
else
  rm $TOGGLE
  riverctl rule-del -app-id '*' float
  notify-send "river" "Tiling Mode"
fi
