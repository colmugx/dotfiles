#!/bin/env/bash

# Load global styles, colors and icons
source "$CONFIG_DIR/configs/styles.sh"

github=(
  "${notification_defaults[@]}"
  icon=􀋚
  icon.y_offset=1
  background.color=$GREY
  icon.color=$BLACK
  script="$PLUGIN_DIR/github.sh"
)

sketchybar --add item github left       \
           --set      github "${github[@]}"
