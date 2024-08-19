#!/bin/bash

sketchybar --add event aerospace_workspace_change

for monitor in $(aerospace list-monitors | awk '{print $1}'); do
  for sid in $(aerospace list-workspaces --monitor $monitor); do

    space=(
      display=$monitor
      icon="$sid"
      icon.padding_left=10
      icon.padding_right=15
      padding_left=2
      padding_right=2
      label.padding_right=20
      icon.highlight_color=$RED
      label.font="sketchybar-app-font:Regular:16.0"
      label.background.height=26
      label.background.drawing=on
      label.background.color=$BACKGROUND_2
      label.background.corner_radius=8
      label.drawing=off
      script="$PLUGIN_DIR/space.sh"
    )

    sketchybar --add item space.$sid left \
               --set space.$sid "${space[@]}" \
               --subscribe space.$sid mouse.clicked \
               --subscribe space.$sid aerospace_workspace_change

  done
done

spaces=(
  background.color=$BACKGROUND_1
  background.border_color=$BACKGROUND_2
  background.border_width=2
  background.drawing=on
)

sketchybar --add bracket spaces '/space\..*/' \
           --set spaces "${spaces[@]}"
