require("RogueBuild01_DetailsRegion2_Exp1ByName")
require("RogueBuild01_DetailsRegion2_Exp2ByName")

function GetRogueBuild01_SweepTipsUis(ui)
  local uis = {}
  uis.TitleTxt = ui:GetChild("TitleTxt")
  uis.NumberTxt = ui:GetChild("NumberTxt")
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.Exp = GetRogueBuild01_DetailsRegion2_Exp1Uis(ui:GetChild("Exp"))
  uis.Talent = GetRogueBuild01_DetailsRegion2_Exp2Uis(ui:GetChild("Talent"))
  uis.CloseBtn = ui:GetChild("CloseBtn")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
