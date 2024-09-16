require("RogueBuild01_DetailsRegion2_Exp1ByName")
require("RogueBuild01_DetailsRegion2_Exp2ByName")

function GetRogueBuild01_DetailsRegion2_ExpUis(ui)
  local uis = {}
  uis.Exp = GetRogueBuild01_DetailsRegion2_Exp1Uis(ui:GetChild("Exp"))
  uis.ExitBtn = ui:GetChild("ExitBtn")
  uis.Talent = GetRogueBuild01_DetailsRegion2_Exp2Uis(ui:GetChild("Talent"))
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
