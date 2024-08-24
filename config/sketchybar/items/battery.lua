local icons = require "configs.icons"
local colors = require "configs.colors"

local battery_style = {
  icon = {
    font = {
      style = "Regular",
      size = 16.0
    },
  },
  label = {
    font = {
      size = 12.0,
    },
  },
  update_freq = 120,
  position = "right"
}

local battery = sbar.add("item", battery_style)

local function battery_update()
  sbar.exec("pmset -g batt", function(batt_info)
    local icon = "!"
    local color = "white"
    local percentage

    local found, _, charge = batt_info:find("(%d+)%%")
    if found then
      charge = tonumber(charge)
      percentage = charge
    end

    if (string.find(batt_info, 'AC Power')) then
      icon = icons.BATTERY_CHARGING
    else
      if found and charge > 90 then
        icon = icons.BATTERY_100
      elseif found and charge > 60 then
        icon = icons.BATTERY_75
      elseif found and charge > 40 then
        icon = icons.BATTERY_50
      elseif found and charge > 10 then
        icon = icons.BATTERY_25
        color = "orange"
      else
        icon = icons.battery._0
        color = "red"
      end
    end

    battery:set({ icon = { string = icon, color = colors.getcolor(color) }, label = percentage .. "%" })
  end)
end

battery:subscribe({ "routine", "power_source_change", "system_woke" }, battery_update)

return battery
