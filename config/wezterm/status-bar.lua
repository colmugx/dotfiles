local Module = {}
local wezterm = require "wezterm"

math.clamp = function(x, min, max)
   return x < min and min or (x > max and max or x)
end

math.round = function(x, increment)
   if increment then
      return math.round(x / increment) * increment
   end
   return x >= 0 and math.floor(x + 0.5) or math.ceil(x - 0.5)
end

Module.separator_char = '    ' -- 4 spaces

Module.colors = {
   date_fg = '#fab387',
   date_bg = '#2e3440',
   battery_fg = '#f9e2af',
   battery_bg = '#2e3440',
   separator_fg = '#74c7ec',
   separator_bg = '#181825',
}

Module.cells = {} -- wezterm FormatItems (ref: https://wezfurlong.org/wezterm/config/lua/wezterm/format.html)

---@param text string
---@param icon string
---@param fg string
---@param bg string
---@param separate boolean
Module.push = function(text, icon, fg, bg, separate)
   table.insert(Module.cells, { Foreground = { Color = fg } })
   table.insert(Module.cells, { Background = { Color = bg } })
   table.insert(Module.cells, { Attribute = { Intensity = 'Bold' } })
   table.insert(Module.cells, { Text = icon .. ' ' .. text .. ' ' })

   if separate then
      table.insert(Module.cells, { Text = Module.separator_char })
   end

   table.insert(Module.cells, 'ResetAttributes')
end

Module.set_date = function()
   local date = wezterm.strftime(' %a %H:%M')
   Module.push(date, '', Module.colors.date_fg, Module.colors.date_bg, true)
end

Module.set_battery = function()
   -- ref: https://wezfurlong.org/wezterm/config/lua/wezterm/battery_info.html
   local charge = ''
   local battery_icon = '🔋'
   local is_charging = '⚡'

   for _, battery in ipairs(wezterm.battery_info()) do
     charge = string.format('%.0f%%', battery.state_of_charge * 100)
     if battery.state == 'Charging' then
        charge = charge .. is_charging
     end
   end

   Module.push(charge, battery_icon, Module.colors.battery_fg, Module.colors.battery_bg, false)
end

Module.setup = function ()
  wezterm.on('update-right-status', function(win)
    Module.cells = {}
    Module.set_date()
    Module.set_battery()

    win:set_right_status(wezterm.format(Module.cells))

  end)
  
end


return Module
