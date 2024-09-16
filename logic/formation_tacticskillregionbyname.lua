require("Formation_TacticProgrammeUseStateByName")

function GetFormation_TacticSkillRegionUis(ui)
  local uis = {}
  uis.SkillList = ui:GetChild("SkillList")
  uis.UseBtn = ui:GetChild("UseBtn")
  uis.UseState = GetFormation_TacticProgrammeUseStateUis(ui:GetChild("UseState"))
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
