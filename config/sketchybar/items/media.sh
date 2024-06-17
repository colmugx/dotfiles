media=(
  icon.background.image.scale=0.8
  icon.background.drawing=on
  icon.background.image=media.artwork
  icon.background.image.corner_radius=9
  script="$PLUGIN_DIR/media.sh"
  label.max_chars=15
  scroll_texts=on
  updates=on
)

sketchybar --add item media right \
           --set media "${media[@]}" \
           --add bracket media_group media \
           --set media_group "${bracket_defaults[@]}" \
           --subscribe media media_change
