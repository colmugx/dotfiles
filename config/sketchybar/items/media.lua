local colors = require "configs.colors"
local styles = require "configs.styles"
local merge_table = require "utils.merge_table"

local media_cover = sbar.add("item", {
  position = "right",
  background = {
    image = {
      string = "media.artwork",
      scale = 0.8,
      corner_radius = 6
    },
    color = colors.catppuccin_colors.TRANSPARENT,
  },
  label = { drawing = false },
  icon = { drawing = false },
  drawing = false,
  updates = true,
})

local media_artist = sbar.add("item", {
  position = "right",
  drawing = false,
  padding_left = 3,
  padding_right = 0,
  width = 0,
  icon = { drawing = false },
  label = {
    width = 0,
    font = { size = 9 },
    color = colors.getcolor("white", 50),
    max_chars = 18,
    y_offset = 6,
  },
})

local media_title = sbar.add("item", {
  position = "right",
  drawing = false,
  padding_left = 3,
  padding_right = 0,
  icon = { drawing = false },
  label = {
    font = { size = 11 },
    width = 0,
    max_chars = 16,
    y_offset = -5,
  },
})

local interrupt = 0
local function animate_detail(detail)
  if (not detail) then interrupt = interrupt - 1 end
  if interrupt > 0 and (not detail) then return end

  sbar.animate("tanh", 30, function()
    media_artist:set({ label = { width = detail and "dynamic" or 0 } })
    media_title:set({ label = { width = detail and "dynamic" or 0 } })
  end)
end

local media = sbar.add("bracket", { media_cover.name, media_title.name, media_artist.name }, styles.bracket_defaults)

media_cover:subscribe("media_change", function(env)
  local drawing = (env.INFO.state == "playing")
  media_artist:set({ drawing = drawing, label = env.INFO.artist, })
  media_title:set({ drawing = drawing, label = env.INFO.title, })
  media_cover:set({ drawing = drawing })

  animate_detail(true)
  interrupt = interrupt + 1
  sbar.delay(5, animate_detail)
end)

media_cover:subscribe("mouse.entered", function(env)
  interrupt = interrupt + 1
  animate_detail(true)
end)

media_cover:subscribe("mouse.exited", function(env)
  animate_detail(false)
end)

return media
