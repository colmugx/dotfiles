#!/bin/env/bash

# Load global styles, colors and icons
source "$CONFIG_DIR/configs/styles.sh"

slack=(
  "${notification_defaults[@]}"
  icon=󰒱
  background.color=$ORANGE
  icon.color=$BLACK
  icon.padding_left=8
  script="$PLUGIN_DIR/slack.sh"
  click_script="open -a /Applications/Slack.app"
)

sketchybar --add item slack left       \
           --set      slack "${slack[@]}" \
           --subscribe slack system_woke
