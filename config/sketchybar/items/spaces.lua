local colors = require "configs.colors"

-- 添加事件监听
sbar.add("event", "aerospace_workspace_change")

local spaces = {}

sbar.exec("aerospace list-monitors", function(monitors_result)
  local monitors = {}
  for line in monitors_result:gmatch("[^\r\n]+") do
    local monitor = line:match("^%s*(%d+)")
    if monitor then
      table.insert(monitors, monitor)
    end
  end

  for _, monitor in ipairs(monitors) do
    sbar.exec("aerospace list-workspaces --monitor " .. monitor, function(workspaces_result)
      local workspaces = {}
      for workspace in workspaces_result:gmatch("%S+") do
        table.insert(workspaces, workspace)
      end

      for _, sid in ipairs(workspaces) do
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
            font = {
              family = "sketchybar-app-font",
              size = 16,
              style = "Regular"
            },
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

        space:subscribe("mouse.clicked", function(res)
          sbar.exec("aerospace workspace " .. res.NAME)
        end)

        space:subscribe({ "aerospace_workspace_change" }, function(res)
          local focused = res.FOCUSED_WORKSPACE or ""
          local name = res.NAME or ""

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
    end)
  end
end)

local spaces_style = {
  background = {
    color = colors.catppuccin_colors.BG1,
    border_color = colors.catppuccin_colors.BG2,
    border_width = 2,
    drawing = true
  }
}

local spaces_perf = sbar.add("bracket", spaces, spaces_style)

spaces_perf:subscribe({ "forced" }, function()
  sbar.exec("aerospace list-workspaces --focused", function(result)
    local focused = result:match("^%s*(.-)%s*$")

    sbar.trigger("aerospace_workspace_change", {
      FOCUSED_WORKSPACE = focused,
    })
  end)
end)

return spaces_perf
