#!/bin/bash

source "$CONFIG_DIR/configs/icons.sh"

wifi=(
  padding_right=7
  label.width=0
  icon="$ICON_WIFI_OFF"
  script="$PLUGIN_DIR/wifi.sh"
)

sketchybar --add item wifi right \
           --set wifi "${wifi[@]}" \
           --subscribe wifi wifi_change mouse.clicked
