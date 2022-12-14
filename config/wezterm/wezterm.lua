local wezterm = require "wezterm"

return {
  color_scheme = "OneHalfDark",
  -- window_decorations = "RESIZE",
  hide_tab_bar_if_only_one_tab = true,
  default_cursor_style = "SteadyBlock",

  font = wezterm.font("JetBrains Mono"),
  font_size = 13.0,

  window_padding = {
    top = 0,
    bottom = 0,
  }
}

