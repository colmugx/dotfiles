local colors = require "configs.colors"

-- 添加事件监听
sbar.add("event", "aerospace_workspace_change")

local function get_monitors()
  local handle = io.popen("aerospace list-monitors")
  if not handle then return {} end

  local result = handle:read("*a")
  handle:close()

  local monitors = {}
  for line in result:gmatch("[^\r\n]+") do
    local monitor = line:match("^%s*(%d+)")
    if monitor then
      table.insert(monitors, monitor)
    end
  end

  return monitors
end

local function get_workspaces(monitor)
  local handle = io.popen("aerospace list-workspaces --monitor " .. monitor)
  if not handle then return {} end

  local result = handle:read("*a")
  handle:close()

  local workspaces = {}
  for workspace in result:gmatch("%S+") do
    table.insert(workspaces, workspace)
  end

  return workspaces
end

local function get_focused_workspace()
  local handle = io.popen("aerospace list-workspaces --focused")
  if not handle then return {} end

  local result = handle:read("*a"):gsub("^%s*(.-)%s*$", "%1")
  handle:close()

  return result
end

local spaces = {}

for _, monitor in ipairs(get_monitors()) do
  for _, sid in ipairs(get_workspaces(monitor)) do
    local space = sbar.add("item", sid, {
      display = monitor,
      icon = {
        string = sid,
        padding_left = 10,
        padding_right = 15,
        highlight_color = colors.catppuccin_colors.RED
      },
      padding_left = 2,
      padding_right = 2,
      label = {
        padding_right = 20,
        font = "sketchybar-app-font:Regular:16.0",
        background = {
          height = 26,
          drawing = true,
          color = colors.catppuccin_colors.BG2,
          corner_radius = 8
        },
        drawing = false
      },
    })

    spaces[sid] = space.name

    space:subscribe("mouse.clicked", function()
    end)

    space:subscribe({ "forced", "aerospace_workspace_change" }, function(res)
      local focused = res.FOCUSED_WORKSPACE or get_focused_workspace()
      local name = res.NAME

      if focused == name then
        sbar.animate("tanh", 30, function()
          space:set({
            icon = {
              highlight = true,
            },
            label = {
              width = 'dynamic',
            },
          })
        end)
      else
        sbar.animate("tanh", 30, function()
          space:set({
            icon = {
              highlight = false,
            },
            label = {
              width = 0,
            },
          })
        end)
      end
    end)
  end
end

local spaces_style = {
  background = {
    color = colors.catppuccin_colors.BG1,
    border_color = colors.catppuccin_colors.BG2,
    border_width = 2,
    drawing = true
  }
}

local spaces_perf = sbar.add("bracket", spaces, spaces_style)

return spaces_perf
