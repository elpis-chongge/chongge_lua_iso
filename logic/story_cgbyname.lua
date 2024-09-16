require("Story_Tab2RegionByName")
require("Story_CGNumberByName")

function GetStory_CGUis(ui)
  local uis = {}
  uis.Tab2Region = GetStory_Tab2RegionUis(ui:GetChild("Tab2Region"))
  uis.CGNumber = GetStory_CGNumberUis(ui:GetChild("CGNumber"))
  uis.CGList = ui:GetChild("CGList")
  uis.root = ui
  return uis
end
