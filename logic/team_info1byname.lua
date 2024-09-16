require("CommonResource_OccupationByName")
require("CommonResource_CardBreachByName")

function GetTeam_Info1Uis(ui)
  local uis = {}
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.LevelTxt = ui:GetChild("LevelTxt")
  uis.StarList = ui:GetChild("StarList")
  uis.ElementList = ui:GetChild("ElementList")
  uis.Occupation = GetCommonResource_OccupationUis(ui:GetChild("Occupation"))
  uis.CardBreach = GetCommonResource_CardBreachUis(ui:GetChild("CardBreach"))
  uis.UpBtn = ui:GetChild("UpBtn")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
