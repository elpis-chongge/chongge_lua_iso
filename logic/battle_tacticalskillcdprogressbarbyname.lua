require("Battle_TacticalSkillCDProgressFillByName")

function GetBattle_TacticalSkillCDProgressBarUis(ui)
  local uis = {}
  uis.bar1 = GetBattle_TacticalSkillCDProgressFillUis(ui:GetChild("bar1"))
  uis.TimeTxt = ui:GetChild("TimeTxt")
  uis.root = ui
  return uis
end
