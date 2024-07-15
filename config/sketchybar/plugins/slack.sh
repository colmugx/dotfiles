#!/usr/bin/env sh
STATUS_LABEL=$(lsappinfo info -only StatusLabel "Slack")
ICON="󰒱"
if [[ $STATUS_LABEL =~ \"label\"=\"([^\"]*)\" ]]; then
    LABEL="${BASH_REMATCH[1]}"

    if [[ $LABEL == "" ]]; then
        sketchybar -m --set $NAME drawing=off
    elif [[ $LABEL == "•" ]]; then
        sketchybar -m --set $NAME drawing=on
    elif [[ $LABEL =~ ^[0-9]+$ ]]; then
        sketchybar -m --set $NAME drawing=on
    else
        exit 0
    fi
else
  exit 0
fi

sketchybar --set $NAME icon=$ICON label="${LABEL}"
