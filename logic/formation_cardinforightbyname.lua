require("Formation_BuildCostRightByName")
require("CommonResource_OccupationByName")
require("Formation_PlayerHPByName")

function GetFormation_CardInfoRightUis(ui)
  local uis = {}
  uis.CardHolder = ui:GetChild("CardHolder")
  uis.BuildingHolder = ui:GetChild("BuildingHolder")
  uis.BuildCost = GetFormation_BuildCostRightUis(ui:GetChild("BuildCost"))
  uis.Occupation = GetCommonResource_OccupationUis(ui:GetChild("Occupation"))
  uis.ElementList = ui:GetChild("ElementList")
  uis.PlayerHP = GetFormation_PlayerHPUis(ui:GetChild("PlayerHP"))
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
