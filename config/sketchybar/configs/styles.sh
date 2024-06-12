source "$CONFIG_DIR/configs/colors.sh"
source "$CONFIG_DIR/configs/icons.sh"

FONT="JetBrainsMono Nerd Font"
PADDINGS=3

# Setting up the general bar appearance of the bar
bar=(
  position=top
  topmost=window
  sticky=on
  height=32
  blur_radius=16
  color=$TRANSPARENT
  padding_right=12
  padding_left=12
)

# Setting up default values
defaults=(
  updates=when_shown
  icon.font="$FONT:Bold:14.0"
  icon.color=$ICON_COLOR
  icon.padding_left=$PADDINGS
  icon.padding_right=$PADDINGS
  label.font="$FONT:Semibold:13.0"
  label.color=$LABEL_COLOR
  label.padding_left=$PADDINGS
  label.padding_right=$PADDINGS
  padding_right=$PADDINGS
  padding_left=$PADDINGS
  background.height=26
  background.corner_radius=9
  background.border_width=2
  popup.background.border_width=2
  popup.background.corner_radius=9
  popup.background.border_color=$POPUP_BORDER_COLOR
  popup.background.color=$POPUP_BACKGROUND_COLOR
  popup.blur_radius=20
  popup.background.shadow.drawing=on
  scroll_texts=on
)

bracket_defaults=(
  background.height=28
  background.color=$BAR_COLOR
  blur_radius=32
  background.corner_radius=6
)