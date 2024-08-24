local colors = require "configs.colors"
local icons = require "configs.icons"

local apple_logo = {
  icon = {
    string = icons.APPLE,
    font = {
      style = "Black",
      size = 16.0
    },
    color = colors.catppuccin_colors.WHITE,
  },
  label = { drawing = false },
  click_script = "$CONFIG_DIR/helpers/menus/bin/menus -s 0",
}

local apple_perf = sbar.add('item', apple_logo)
sbar.add('item', { width = 8 })

return apple_perf
