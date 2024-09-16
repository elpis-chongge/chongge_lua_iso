require("CommonResource_OccupationByName")

function GetExplore_AFKCardChoiceBtnUis(ui)
  local uis = {}
  uis.QBHolder = ui:GetChild("QBHolder")
  uis.Occupation = GetCommonResource_OccupationUis(ui:GetChild("Occupation"))
  uis.buttonCtr = ui:GetController("button")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
