require("Battle_UniqueSkillTipsByName")

function GetBattle_UniqueSkillTipsAniUis(ui)
  local uis = {}
  uis.SkillTips = GetBattle_UniqueSkillTipsUis(ui:GetChild("SkillTips"))
  uis.root = ui
  return uis
end
