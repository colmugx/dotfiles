local clipboard = require("modules.clipboard")


clipboard_keys = {{"cmd", "shift"}, "v"}
hs.hotkey.bind(clipboard_keys[1], clipboard_keys[2], function()
  clipboard:show()
end)

