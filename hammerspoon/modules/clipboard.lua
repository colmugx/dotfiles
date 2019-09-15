local history = {}
local size = 40
local imgType = 'public.png'
local textType = 'public.utf8-plain-text'

local pasteboard = require('hs.pasteboard')

local clipBoardCS
local counts = pasteboard.changeCount()

function getItemInHistory()
  local types = pasteboard.contentTypes()
  local item = {}

  for idx, uti in ipairs(types) do
    if uti == imgType then
      local img = pasteboard.readImage()
      item.type = imgType
      item.content = img
      break
    elseif uti == textType then
      local text = pasteboard.readString()
      if text == nil or utf8.len(text) < 3 then
        return
      end
      item.type = textType
      item.content = text
      break
    end
  end

  for idx, el in ipairs(history) do
    if item.content == el.content then
      table.remove(history, idx)
    end
  end

  table.insert(history, 1, item)

  if (#history > size) then
    table.remove(history)
  end
end

clipBoardCS = hs.chooser.new(function(selected)
  if selected then
    local content = selected.content
    if selected.type == imgType then
      pasteboard.writeObjects(content)
    else
      pasteboard.setContents(content)
    end
  end
end)

local watcher = hs.timer.new(1, function()
  local changeCount = pasteboard.changeCount()
  if changeCount ~= counts then
    pcall(getItemInHistory)
    counts = changeCount
  end
end)
watcher:start()

function showBoard()
  local choices = hs.fnutils.map(history, function(item)
    local choice = hs.fnutils.copy(item)
    if choice.type == imgType then
      choice.image = item.content
      choice.text = " IMAGE CAUGHT"
    else
      choice.text = item.content
    end
    return choice
  end)

  clipBoardCS:choices(choices)
  clipBoardCS:show()
end

local chooser = {}
chooser.clipboard = clipBoardCS
chooser.show = showBoard

return chooser
