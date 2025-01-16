#!/bin/sh
TOGGLE=$HOME/.config/river/.modetoggle

if [ ! -e $TOGGLE ]; then
  touch $TOGGLE
  riverctl rule-add -app-id '*' float
  notify-send "river" "Floating Mode"
else
  rm $TOGGLE
  riverctl rule-del -app-id '*' float
  notify-send "river" "Tiling Mode"
fi
