local network = require('hs.network')
local menubar = hs.menubar:new()
local history = {}

local textStyle = {
  font = {
    size = 9
  },
  paragraphStyle = {
    alignment = 'left',
    maximumLineHeight = 10.0
  },
  baselineOffset = 2.0
}

local function netCommand(inter)
  return {
    up = 'netstat -ibn | grep -e ' .. inter .. " -m 1 | awk '{print $10}'",
    down = 'netstat -ibn | grep -e ' .. inter .. " -m 1 | awk '{print $7}'"
  }
end

local function genMenuitem(val, title)
  return {
    title = title .. ': ' .. val,
    tooltip = 'Copy That',
    fn = function() hs.pasteboard.setContents(val) end
  }
end

local function refreshNetwork()
  local interface = network.primaryInterfaces()
  local network_detail = network.interfaceDetails(interface)
  local menu_list = {}

  if network_detail.IPv4 then
    local ipv4 = network_detail.IPv4.Addresses[1]
    table.insert(menu_list, genMenuitem(ipv4, 'IPv4'))
  end
  if network_detail.IPv6 then
    local ipv6 = network_detail.IPv6.Addresses[1]
    table.insert(menu_list, genMenuitem(ipv6, 'IPv6'))
  end

  local cmd_group = netCommand(interface)

  history.up_data = hs.execute(cmd_group.up)
  history.down_data = hs.execute(cmd_group.down)

  return menu_list
end

local function diffData()
  local old_up = history.up_data
  local old_down = history.down_data
  refreshNetwork()

  local current_up = history.up_data
  local current_down = history.down_data

  local diff_up = current_up - old_up
  local diff_down = current_down - old_down

  local speed_up
  local speed_down

  if diff_down / 1024 > 1024 then
    speed_down = string.format("%6.2f", diff_down / 1024 / 1024) .. 'mb/s'
  else
    speed_down = string.format("%6.2f", diff_down / 1024) .. 'kb/s'
  end
  if diff_up / 1024 > 1024 then
    speed_up = string.format("%6.2f", diff_up / 1024 / 1024) .. 'mb/s'
  else
    speed_up = string.format("%6.2f", diff_up / 1024) .. 'kb/s'
  end

  history.up_data = current_up
  history.down_data = current_down

  return {
    up = speed_up,
    down = speed_down
  }
end


local function start()
  local menu = refreshNetwork()
  local watcher = hs.timer.new(1, function()
    local diff = diffData()
    local str = '↑: ' .. diff.up .. '\n' .. '↓: ' .. diff.down
    local title = hs.styledtext.new(str, textStyle)

    menubar:setTitle(title)
  end)

  menubar:setMenu(menu)
  watcher:start()
end

start()
