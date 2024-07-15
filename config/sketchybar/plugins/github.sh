#!/bin/bash

NOTIFICATIONS="$(gh api notifications)"
COUNT="$(echo "$NOTIFICATIONS" | jq 'length')"

if [[ $COUNT -gt 0 ]]; then
  sketchybar -m --set $NAME drawing=on label="$COUNT"
else
  sketchybar -m --set $NAME drawing=off
fi
