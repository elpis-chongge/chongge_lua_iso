require("Team_Info1ByName")
require("Team_Info2ByName")
require("Team_Info3ByName")
require("Team_Info4ByName")

function GetTeam_InfoUis(ui)
  local uis = {}
  uis.Info1 = GetTeam_Info1Uis(ui:GetChild("Info1"))
  uis.Info2 = GetTeam_Info2Uis(ui:GetChild("Info2"))
  uis.Info3 = GetTeam_Info3Uis(ui:GetChild("Info3"))
  uis.Info4 = GetTeam_Info4Uis(ui:GetChild("Info4"))
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
