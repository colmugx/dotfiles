#!/bin/bash

sketchybar --set $NAME icon="$(LC_TIME=en_US.UTF-8 date '+%Y %b %d(%a)')" label="$(date '+%H:%M')"
