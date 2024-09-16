require("Adventure_PicMapByName")

function GetAdventure_DailyDungeonMapUis(ui)
  local uis = {}
  uis.PicMap = GetAdventure_PicMapUis(ui:GetChild("PicMap"))
  uis.DailyTypeList = ui:GetChild("DailyTypeList")
  uis.DailyStartBtn = ui:GetChild("DailyStartBtn")
  uis.root = ui
  return uis
end
