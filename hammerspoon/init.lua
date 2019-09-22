local clipboard = require("modules.clipboard")
local network_status = require('modules.network_status')

hspoon_list = {
  "HSearch",
}

for _, v in pairs(hspoon_list) do
  hs.loadSpoon(v)
end

if spoon.HSearch then
  search_keys = {"alt", "space"}
  hs.hotkey.bind(search_keys[1], search_keys[2], function() spoon.HSearch.toggleShow() end)
end

clipboard_keys = {{"cmd", "shift"}, "v"}
hs.hotkey.bind(clipboard_keys[1], clipboard_keys[2], function()
  clipboard:show()
end)

