sbar = require "sketchybar"
local styles = require "configs.styles"

sbar.begin_config()
  sbar.bar(styles.bar)
  sbar.default(styles.defaults)
  require "items"
  sbar.hotload(true)
  print "sketchybar configuation loaded.."
sbar.end_config()

sbar.event_loop()

