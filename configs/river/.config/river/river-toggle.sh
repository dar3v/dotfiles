#!/bin/sh

set -ueo pipefail

RIVER_MODE="/tmp/river_mode.txt"

if [ ! -f $RIVER_MODE ]; then
  echo "tile" > $RIVER_MODE
fi

init() {
  riverctl rule-add -app-id '*' float
  notify-send -a river "floating mode"
  echo "tile" > $RIVER_MODE
}

toggle() {
  CURRENT_MODE=$(cat "$RIVER_MODE")
  case "$CURRENT_MODE" in
    tile)
      riverctl rule-del -app-id '*' float
      notify-send -a river "tiling mode"
      echo "float" > $RIVER_MODE
      ;;
    float)
      riverctl rule-add -app-id '*' float
      notify-send -a river "floating mode"
      echo "tile" > $RIVER_MODE
      ;;
    *)
      riverctl rule-add -app-id '*' float
      notify-send -u critical -a river \
        "something unexpected happened." \
        "switching to tiling mode."
      echo 'float' > "$RIVER_MODE"
      ;;
  esac
}

case "${1:-}" in
  -init) init ;;
  -toggle) toggle ;;
  *) echo "usage: $0 [-init|-toggle]" ;;
esac
