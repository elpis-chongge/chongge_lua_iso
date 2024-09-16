require("RogueBuild01_ChoiceCardList_Info1ByName")
require("RogueBuild01_ChoiceCardList_Info2ByName")
require("RogueBuild01_ChoiceCardList_Info3ByName")
require("RogueBuild01_ChoiceCardList_Info4ByName")

function GetRogueBuild01_ChoiceCardList_InfoUis(ui)
  local uis = {}
  uis.Info1 = GetRogueBuild01_ChoiceCardList_Info1Uis(ui:GetChild("Info1"))
  uis.Info2 = GetRogueBuild01_ChoiceCardList_Info2Uis(ui:GetChild("Info2"))
  uis.Info3 = GetRogueBuild01_ChoiceCardList_Info3Uis(ui:GetChild("Info3"))
  uis.Info4 = GetRogueBuild01_ChoiceCardList_Info4Uis(ui:GetChild("Info4"))
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
