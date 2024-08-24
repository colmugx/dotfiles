local colors = require "configs.colors"

-- 添加事件监听
sbar.add("event", "aerospace_workspace_change")

local function get_focused_workspace()
  local handle = io.popen("aerospace list-workspaces --focused")
  if not handle then return {} end

  local result = handle:read("*a"):gsub("^%s*(.-)%s*$", "%1")
  handle:close()

  return result
end

local spaces = {}

sbar.exec("aerospace list-monitors", function(monitors)
  for _, monitor in ipairs(monitors) do
    sbar.exec("aerospace list-workspaces --monitor " .. monitor, function(workspaces)
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

        space:subscribe("mouse.clicked", function(res)
          sbar.exec("aerospace workspace " .. res.NAME)
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

return spaces_perf
