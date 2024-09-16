require("RogueBuild01_TreasureTypeByName")
require("RogueBuild01_TreasureLevelByName")

function GetRogueBuild01_ItemLook_TreasureItemBtnUis(ui)
  local uis = {}
  uis.PicLoader = ui:GetChild("PicLoader")
  uis.IDTxt = ui:GetChild("IDTxt")
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.Type = GetRogueBuild01_TreasureTypeUis(ui:GetChild("Type"))
  uis.Level = GetRogueBuild01_TreasureLevelUis(ui:GetChild("Level"))
  uis.EffectTxt = ui:GetChild("EffectTxt")
  uis.buttonCtr = ui:GetController("button")
  uis.root = ui
  return uis
end
