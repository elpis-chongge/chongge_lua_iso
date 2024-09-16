require("RogueBuild01_TreasureLevelByName")
require("RogueBuild01_TreasureTypeByName")
require("RogueBuild01_Buy_GetByName")

function GetRogueBuild01_Buy_TipsUis(ui)
  local uis = {}
  uis.CloseBtn = ui:GetChild("CloseBtn")
  uis.PicLoader = ui:GetChild("PicLoader")
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.IDTxt = ui:GetChild("IDTxt")
  uis.Level = GetRogueBuild01_TreasureLevelUis(ui:GetChild("Level"))
  uis.Type = GetRogueBuild01_TreasureTypeUis(ui:GetChild("Type"))
  uis.WordList = ui:GetChild("WordList")
  uis.BuyBtn = ui:GetChild("BuyBtn")
  uis.Get = GetRogueBuild01_Buy_GetUis(ui:GetChild("Get"))
  uis.LookBtn = ui:GetChild("LookBtn")
  uis.c1Ctr = ui:GetController("c1")
  uis.c2Ctr = ui:GetController("c2")
  uis.root = ui
  return uis
end
