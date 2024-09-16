require("CommonResource_OccupationByName")
require("CommonResource_CardBreachByName")
require("Formation_CardAttributeModuleByName")

function GetFormation_CardInfoUis(ui)
  local uis = {}
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.StarList = ui:GetChild("StarList")
  uis.Occupation = GetCommonResource_OccupationUis(ui:GetChild("Occupation"))
  uis.OccupationTxt = ui:GetChild("OccupationTxt")
  uis.ElementList = ui:GetChild("ElementList")
  uis.ElementTxt = ui:GetChild("ElementTxt")
  uis.LevelTxt = ui:GetChild("LevelTxt")
  uis.CardBreach = GetCommonResource_CardBreachUis(ui:GetChild("CardBreach"))
  uis.CardAttributeModule = GetFormation_CardAttributeModuleUis(ui:GetChild("CardAttributeModule"))
  uis.root = ui
  return uis
end
