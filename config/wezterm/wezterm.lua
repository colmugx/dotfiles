local wezterm = require "wezterm"

require("status-bar").setup()

return {
  color_scheme = "nord",
  window_decorations = "RESIZE",
  default_cursor_style = "SteadyBlock",

  font = wezterm.font_with_fallback {
    "Maple Mono",
    "JetBrainsMono Nerd Font Mono",
    "PingFang SC"
  },

  font_size = 13.0,

  window_padding = {
    top = 0,
    bottom = 0,
  },

  window_background_opacity = 0.90,
  macos_window_background_blur = 20,
}

