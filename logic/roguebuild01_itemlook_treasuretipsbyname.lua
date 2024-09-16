require("RogueBuild01_BookTreasureInfoByName")
require("RogueBuild01_ItemLook_TreasureChoiceByName")

function GetRogueBuild01_ItemLook_TreasureTipsUis(ui)
  local uis = {}
  uis.Info = GetRogueBuild01_BookTreasureInfoUis(ui:GetChild("Info"))
  uis.ItemList = ui:GetChild("ItemList")
  uis.ScreenBtn = ui:GetChild("ScreenBtn")
  uis.Choice = GetRogueBuild01_ItemLook_TreasureChoiceUis(ui:GetChild("Choice"))
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
