local colors = require "configs.colors"

local fa_style = {
  icon = {
    background = {
      image = {
        scale = 0.8
      },
      color = colors.catppuccin_colors.TRANSPARENT,
    },
  },
  label = {
    font = {
      style = "Black",
      size = 13.0
    }
  },
  position = "center"
}

local front_app = sbar.add("item", fa_style)

front_app:subscribe({ "front_app_switched" }, function(env)
  front_app:set({
    icon = {
      background = { image = { string = "app." .. env.INFO } }
    },
    label = { string = env.INFO }
  })
end)

return front_app
