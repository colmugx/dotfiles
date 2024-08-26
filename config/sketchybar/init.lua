sbar = require "sketchybar"
local styles = require "configs.styles"

sbar.begin_config()
  sbar.bar(styles.bar)
  sbar.default(styles.defaults)
  require "items"
  sbar.hotload(true)
sbar.end_config()

print "sketchybar configuation loaded.."
sbar.event_loop()
