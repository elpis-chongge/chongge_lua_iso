require("Formation_TacticSkillEffectLevelSignByName")

function GetFormation_TacticSkillEffectLevelUis(ui)
  local uis = {}
  uis.LevelTxt = ui:GetChild("LevelTxt")
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.Sign = GetFormation_TacticSkillEffectLevelSignUis(ui:GetChild("Sign"))
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
