#!/bin/bash

front_app=(
  label.font="$FONT:Black:13.0"
  icon.background.drawing=on
  icon.background.image.scale=0.8
  icon.padding_left=8
  label.padding_right=8
  display=active
  script="$PLUGIN_DIR/front_app.sh"
  click_script="open -a 'Mission Control'"
)

sketchybar --add item front_app left         \
           --set front_app "${front_app[@]}" \
           --subscribe front_app front_app_switched
