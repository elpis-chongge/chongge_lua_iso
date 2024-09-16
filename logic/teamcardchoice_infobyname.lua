require("TeamCardChoice_Info1ByName")
require("TeamCardChoice_Info2ByName")
require("TeamCardChoice_Info3ByName")
require("TeamCardChoice_Info4ByName")

function GetTeamCardChoice_InfoUis(ui)
  local uis = {}
  uis.Info1 = GetTeamCardChoice_Info1Uis(ui:GetChild("Info1"))
  uis.Info2 = GetTeamCardChoice_Info2Uis(ui:GetChild("Info2"))
  uis.Info3 = GetTeamCardChoice_Info3Uis(ui:GetChild("Info3"))
  uis.Info4 = GetTeamCardChoice_Info4Uis(ui:GetChild("Info4"))
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
