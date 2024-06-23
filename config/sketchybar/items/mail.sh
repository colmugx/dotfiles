#!/bin/env/bash

# Load global styles, colors and icons
source "$CONFIG_DIR/configs/styles.sh"

mail=(
  "${notification_defaults[@]}"
  icon=􀍕
  icon.y_offset=1
  background.color=$YELLOW
  icon.color=$BLACK
  script="$PLUGIN_DIR/mail.sh"
  click_script="open -a /System/Applications/Mail.app"
)

sketchybar --add item mail left       \
           --set      mail "${mail[@]}"