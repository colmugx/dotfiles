local colors = require "configs.colors"
local styles = require "configs.styles"
local merge_table = require "utils.merge_table"

local slack_style = {
  icon = {
    string = "󰒱",
    color = colors.catppuccin_colors.BLACK,
  },
  background = {
    color = colors.catppuccin_colors.ORANGE
  }
}

local slack = sbar.add("item", merge_table(styles.notification_defaults, slack_style))

slack:subscribe("mouse.clicked", function()
  sbar.exec("open -a /Applications/Slack.app")
end)

slack:subscribe({ "forced", "routine", "system_woke" }, function()
  sbar.exec("lsappinfo info -only StatusLabel \"Slack\"", function(result)
    local text = result:match('"label"="(%d+)"')

    if text == "" then
      slack:set({ drawing = false })
    else
      slack:set({ drawing = true, label = text })
    end
  end)
end)

return slack
