require("Formation_RoundStripCardHeadBgByName")
require("CommonResource_OccupationByName")

function GetFormation_RoundStripCardHeadUis(ui)
  local uis = {}
  uis.HeadBg = GetFormation_RoundStripCardHeadBgUis(ui:GetChild("HeadBg"))
  uis.Occupation = GetCommonResource_OccupationUis(ui:GetChild("Occupation"))
  uis.ElementList = ui:GetChild("ElementList")
  uis.c1Ctr = ui:GetController("c1")
  uis.c2Ctr = ui:GetController("c2")
  uis.root = ui
  return uis
end
