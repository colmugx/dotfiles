local colors = require "configs.colors"
local styles = require "configs.styles"
local merge_table = require "utils.merge_table"

local github_style = {
  icon = {
    string = "􀋚",
    color = colors.catppuccin_colors.BLACK,
  },
  background = {
    color = colors.catppuccin_colors.GREY
  }
}

local github = sbar.add("item", merge_table(styles.notification_defaults, github_style))

github:subscribe({ "forced", "routine", "system_woke" }, function()
  sbar.exec("gh api notifications", function(result)
    if result.length ~= 0 then
      github:set({ drawing = false })
    else
      github:set({ drawing = true, label = result.length })
    end
  end)
end)

return github
