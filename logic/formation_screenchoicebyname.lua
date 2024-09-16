require("Formation_ScreenTipsByName")
require("Formation_OprTipsByName")
require("Formation_TacticSkillByName")

function GetFormation_ScreenChoiceUis(ui)
  local uis = {}
  uis.TouchScreenBtn = ui:GetChild("TouchScreenBtn")
  uis.ScreenTips = GetFormation_ScreenTipsUis(ui:GetChild("ScreenTips"))
  uis.OprTips = GetFormation_OprTipsUis(ui:GetChild("OprTips"))
  uis.TacticSkill = GetFormation_TacticSkillUis(ui:GetChild("TacticSkill"))
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
