local cal = sbar.add("item", {
  icon = {
    string = "cal",
    font = {
      style = "Bold",
      size = 12.0,
    },
  },
  label = {
    align = "right",
  },
  position = "right",
  update_freq = 30,
})

cal:subscribe({ "forced", "routine", "system_woke" }, function()
  cal:set({
    icon = os.date("%Y %b %d(%a)"),
    label = os.date("%H:%M")
  })
end)

return cal
