require("RogueBuild01_TreasureLevelByName")
require("RogueBuild01_TreasureTypeByName")

function GetRogueBuild01_Camp_ItemTipsRegionUis(ui)
  local uis = {}
  uis.CloseBtn = ui:GetChild("CloseBtn")
  uis.PicLoader = ui:GetChild("PicLoader")
  uis.IDTxt = ui:GetChild("IDTxt")
  uis.Level = GetRogueBuild01_TreasureLevelUis(ui:GetChild("Level"))
  uis.Type = GetRogueBuild01_TreasureTypeUis(ui:GetChild("Type"))
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.WordList = ui:GetChild("WordList")
  uis.root = ui
  return uis
end
