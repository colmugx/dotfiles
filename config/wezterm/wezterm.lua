local wezterm = require "wezterm"

return {
  color_scheme = "nord",
  window_decorations = "RESIZE",
  default_cursor_style = "SteadyBlock",

  font = wezterm.font_with_fallback {
    "Inconsolata Nerd Font Mono",
    "UbuntuMono Nerd Font Mono",
    "JetBrainsMono Nerd Font Mono",
    "PingFang SC"
  },

  font_size = 14,

  window_padding = {
    top = 0,
    bottom = 0,
  },

  window_background_opacity = 0.90,
  macos_window_background_blur = 20,
}

