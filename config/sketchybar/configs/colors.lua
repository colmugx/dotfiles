local function combine_color(r, g, b, a)
  return (a << 24) + (r << 16) + (g << 8) + b
end

local colors = {
  black = 0x1a1b26,
  white = 0xcfc9c2,
  blue = 0x7dcfff,
  teal = 0x73daca,
  cyan = 0xb4f9f8,
  green = 0x9ece6a,
  yellow = 0xe0af68,
  orange = 0xff9e64,
  red = 0xf7768e,
  purple = 0xbb9af7,
}

local opacities = {
  [100] = 0xff,
  [75] = 0xbf,
  [50] = 0x80,
  [25] = 0x40,
  [10] = 0x1a,
  [0] = 0x00
}

local function getcolor(color_name, opacity)
  opacity = opacities[opacity] or opacities[100]
  local color = colors[color_name]

  if not color then
    error("Invalid color name: " .. color_name)
  end

  return combine_color(color >> 16 & 0xff, color >> 8 & 0xff, color & 0xff, opacity)
end

local function daily_color()
  local day_of_week = os.date("*t").wday
  local _colors = { "blue", "teal", "cyan", "green", "yellow", "orange", "red", "purple" }
  return _colors[day_of_week]
end

-- Choose a random highlight color name
local highlight_color = daily_color()

local bar_colors = {
  bar = getcolor("black", 75),
  highlight = getcolor(highlight_color),
  highlight_75 = getcolor(highlight_color, 75),
  highlight_50 = getcolor(highlight_color, 50),
  highlight_25 = getcolor(highlight_color, 25),
  highlight_10 = getcolor(highlight_color, 10),
  icon = getcolor("white"),
  icon_inactive = getcolor("white", 50),
  label = getcolor("white", 75),
  popup_background = getcolor("black", 25),
  popup_border = getcolor("black", 0),
  shadow = getcolor("black"),
  transparent = getcolor("black", 0)
}

-- Catppuccin colors
local catppuccin_colors = {
  BLACK = getcolor("black"),
  WHITE = getcolor("white"),
  RED = getcolor("red"),
  GREEN = getcolor("green"),
  BLUE = getcolor("blue"),
  YELLOW = getcolor("yellow"),
  ORANGE = getcolor("orange"),
  MAGENTA = getcolor("purple"),
  GREY = 0xff939ab7,
  TRANSPARENT = getcolor("black", 0),
  BG0 = getcolor("black", 0),
  BG1 = getcolor("black", 25),
  BG2 = getcolor("black", 50)
}

return {
  colors = colors,
  bar_colors = bar_colors,
  catppuccin_colors = catppuccin_colors,
  getcolor = getcolor,
  daily_color = daily_color
}
