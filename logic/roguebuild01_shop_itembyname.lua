require("RogueBuild01_Shop_PointItemByName")
require("RogueBuild01_TreasureTypeByName")
require("RogueBuild01_TreasureLevelByName")

function GetRogueBuild01_Shop_ItemUis(ui)
  local uis = {}
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.PicLoader = ui:GetChild("PicLoader")
  uis.PointItem = GetRogueBuild01_Shop_PointItemUis(ui:GetChild("PointItem"))
  uis.IDTxt = ui:GetChild("IDTxt")
  uis.Type = GetRogueBuild01_TreasureTypeUis(ui:GetChild("Type"))
  uis.Level = GetRogueBuild01_TreasureLevelUis(ui:GetChild("Level"))
  uis.FreeTxt = ui:GetChild("FreeTxt")
  uis.PriceTxt = ui:GetChild("PriceTxt")
  uis.HaveTxt = ui:GetChild("HaveTxt")
  uis.c1Ctr = ui:GetController("c1")
  uis.c2Ctr = ui:GetController("c2")
  uis.c3Ctr = ui:GetController("c3")
  uis.root = ui
  return uis
end
