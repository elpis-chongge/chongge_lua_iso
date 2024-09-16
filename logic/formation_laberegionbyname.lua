require("CommonResource_ArenaDefendNewByName")

function GetFormation_LabeRegionUis(ui)
  local uis = {}
  uis.LabelTopBtn = ui:GetChild("LabelTopBtn")
  uis.LabelDownBtn = ui:GetChild("LabelDownBtn")
  uis.New = GetCommonResource_ArenaDefendNewUis(ui:GetChild("New"))
  uis.c1Ctr = ui:GetController("c1")
  uis.newCtr = ui:GetController("new")
  uis.root = ui
  return uis
end
