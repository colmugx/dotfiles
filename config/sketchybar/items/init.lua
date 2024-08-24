require "items/apple"
require "items/spaces"

local styles = require "configs.styles"

local apple = require "items/apple"
local spaces = require "items/spaces"
local mail = require "items/mail"
local front_app = require "items/front_app"

local cal = require "items/calendar"
local battery = require "items/battery"
local wifi = require "items/wifi"
local volume = require "items/volume"
local media = require "items/media"


sbar.add("bracket", "left_side", { apple.name, spaces.name }, styles.bracket_defaults)
sbar.add("bracket", "center_side", { front_app.name }, styles.bracket_defaults)
sbar.add("bracket", "right_side", { cal.name, battery.name, wifi.name, volume.name }, styles.bracket_defaults)
