local colors = require "configs.colors"
local styles = require "configs.styles"
local merge_table = require "utils.merge_table"

local mail_style = {
  icon = {
    string = "􀍕",
    color = colors.catppuccin_colors.BLACK,
  },
  background = {
    color = colors.catppuccin_colors.YELLOW
  }
}

local mail = sbar.add("item", merge_table(styles.notification_defaults, mail_style))

mail:subscribe("mouse.clicked", function()
  sbar.exec("open -a /System/Applications/Mail.app")
end)

mail:subscribe({ "forced", "routine", "system_woke" }, function()
  sbar.exec("lsappinfo info -only StatusLabel \"邮件\"", function(result)
    local text = tonumber(result:match('"label"="(%d+)"') or '0')

    if text > 0 then
      mail:set({ drawing = true, label = text })
    else
      mail:set({ drawing = false })
    end
  end)
end)

return mail
