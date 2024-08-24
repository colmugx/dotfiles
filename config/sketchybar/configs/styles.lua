local colors = require "configs.colors"

local FONT = "JetBrainsMono Nerd Font"
local PADDINGS = 6

-- 设置栏的一般外观
local bar = {
  position = "top",
  topmost = "window",
  sticky = true,
  height = 32,
  blur_radius = 16,
  color = colors.catppuccin_colors.TRANSPARENT,
  padding_right = 12,
  padding_left = 12
}

-- 设置默认值
local defaults = {
  updates = "when_shown",
  icon = {
    font = {
      family = FONT,
      style = "Bold",
      size = 14.0
    },
    color = colors.bar_colors.icon,
    padding_left = PADDINGS,
    padding_right = PADDINGS
  },
  label = {
    font = {
      family = FONT,
      style = "Semibold",
      size = 13.0
    },
    color = colors.bar_colors.label,
    padding_left = PADDINGS,
    padding_right = PADDINGS
  },
  padding_right = PADDINGS,
  padding_left = PADDINGS,
  background = {
    height = 26,
    corner_radius = 9,
    border_width = 2
  },
  popup = {
    background = {
      border_width = 2,
      corner_radius = 9,
      border_color = colors.bar_colors.popup_border,
      color = colors.bar_colors.popup_background,
      shadow = {
        drawing = true
      }
    },
    blur_radius = 20
  },
  scroll_texts = true
}

local bracket_defaults = {
  background = {
    height = 28,
    color = colors.bar_colors.bar,
    corner_radius = 6
  },
  blur_radius = 32,
}

local notification_defaults = {
  drawing = false,
  update_freq = 60,
  updates = true,
  background = {
    color = colors.getcolor("white", 25),
    corner_radius = 6
  },
  icon = {
    font = {
      size = 12
    },
    color = colors.getcolor("black", 75)
  },
  label = {
    color = colors.getcolor("black", 75),
    padding_left = -1,
    font = {
      size = 12,
      style = "Bold"
    }
  }
}

-- 返回样式配置,以便其他模块可能需要使用
return {
  FONT = FONT,
  PADDINGS = PADDINGS,
  bar = bar,
  defaults = defaults,
  bracket_defaults = bracket_defaults,
  notification_defaults = notification_defaults
}
