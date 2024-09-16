require("RogueBuild01_BookTreasureInfoByName")
require("RogueBuild01_BookTreasureTitleByName")
require("RogueBuild01_BookTreasureChoiceByName")

function GetRogueBuild01_BookTreasureTipsUis(ui)
  local uis = {}
  uis.Info = GetRogueBuild01_BookTreasureInfoUis(ui:GetChild("Info"))
  uis.Title = GetRogueBuild01_BookTreasureTitleUis(ui:GetChild("Title"))
  uis.ItemList = ui:GetChild("ItemList")
  uis.ScreenBtn = ui:GetChild("ScreenBtn")
  uis.Screen1Btn = ui:GetChild("Screen1Btn")
  uis.Choice = GetRogueBuild01_BookTreasureChoiceUis(ui:GetChild("Choice"))
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
