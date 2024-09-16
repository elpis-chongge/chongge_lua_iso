require("Battle_BurstUniqueSkillTipsByName")

function GetBattle_BurstUniqueSkillTipsAniUis(ui)
  local uis = {}
  uis.SkillTips = GetBattle_BurstUniqueSkillTipsUis(ui:GetChild("SkillTips"))
  uis.root = ui
  return uis
end
