#!/bin/bash

update() {
  WIDTH="dynamic"
  FOCUSED_WORKSPACE="space.$(aerospace list-workspaces --focused)"

  if [ "$FOCUSED_WORKSPACE" = "$NAME" ]; then
    sketchybar --animate tanh 20 --set $NAME icon.highlight=true label.width="dynamic"
  else
    sketchybar --animate tanh 20 --set $NAME icon.highlight=false label.width=0
  fi
}

mouse_clicked() {
  if [ "$BUTTON" = "right" ]; then
    echo ''
  else
    aerospace workspace ${NAME#*.}
  fi
}

case "$SENDER" in
  "mouse.clicked") mouse_clicked
  ;;
  *) update
  ;;
esac
