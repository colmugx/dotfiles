local wezterm = require "wezterm"

return {
  color_scheme = "nord",
  -- window_decorations = "RESIZE",
  hide_tab_bar_if_only_one_tab = true,
  default_cursor_style = "SteadyBlock",

  font = wezterm.font_with_fallback {
    "JetBrainsMono Nerd Font Mono",
    "PingFang SC"
  },

  font_size = 13.0,

  window_padding = {
    top = 0,
    bottom = 0,
  }
}

