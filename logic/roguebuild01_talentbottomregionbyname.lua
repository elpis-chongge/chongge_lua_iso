require("RogueBuild01_TalentState1ByName")
require("RogueBuild01_TalentState3ByName")
require("RogueBuild01_TalentState4ByName")
require("RogueBuild01_TalentState5ByName")

function GetRogueBuild01_TalentBottomRegionUis(ui)
  local uis = {}
  uis.TitleTxt = ui:GetChild("TitleTxt")
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.State2Btn = ui:GetChild("State2Btn")
  uis.State1 = GetRogueBuild01_TalentState1Uis(ui:GetChild("State1"))
  uis.State3 = GetRogueBuild01_TalentState3Uis(ui:GetChild("State3"))
  uis.State4 = GetRogueBuild01_TalentState4Uis(ui:GetChild("State4"))
  uis.State5 = GetRogueBuild01_TalentState5Uis(ui:GetChild("State5"))
  uis.typeCtr = ui:GetController("type")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
