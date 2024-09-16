require("RogueBuild01_Sacred_TipsTitleByName")
require("RogueBuild01_Sacred_TipsNameByName")
require("RogueBuild01_Sacred_TipsItemByName")
require("RogueBuild01_BookSacredHeadByName")

function GetRogueBuild01_Sacred_TipsUis(ui)
  local uis = {}
  uis.Title = GetRogueBuild01_Sacred_TipsTitleUis(ui:GetChild("Title"))
  uis.Name = GetRogueBuild01_Sacred_TipsNameUis(ui:GetChild("Name"))
  uis.TouchScreenBtn = ui:GetChild("TouchScreenBtn")
  uis.Item = GetRogueBuild01_Sacred_TipsItemUis(ui:GetChild("Item"))
  uis.Head = GetRogueBuild01_BookSacredHeadUis(ui:GetChild("Head"))
  uis.WordList = ui:GetChild("WordList")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
