require("Formation_MonsterTypeByName")
require("CommonResource_OccupationByName")
require("Formation_CardAttributeModuleByName")

function GetFormation_MonsterInfoUis(ui)
  local uis = {}
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.MonsterType = GetFormation_MonsterTypeUis(ui:GetChild("MonsterType"))
  uis.Occupation = GetCommonResource_OccupationUis(ui:GetChild("Occupation"))
  uis.OccupationTxt = ui:GetChild("OccupationTxt")
  uis.ElementList = ui:GetChild("ElementList")
  uis.ElementTxt = ui:GetChild("ElementTxt")
  uis.MonsterAttributeModule = GetFormation_CardAttributeModuleUis(ui:GetChild("MonsterAttributeModule"))
  uis.root = ui
  return uis
end
