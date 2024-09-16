require("RogueBuild01_DayRewardIntegralByName")

function GetRogueBuild01_DayRewardTipsUis(ui)
  local uis = {}
  uis.NumberTxt = ui:GetChild("NumberTxt")
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.Integral = GetRogueBuild01_DayRewardIntegralUis(ui:GetChild("Integral"))
  uis.TipsTxt = ui:GetChild("TipsTxt")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
