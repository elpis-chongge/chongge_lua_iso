require("Battle_SmallSkillTipsByName")

function GetBattle_SmallSkillTipsAniUis(ui)
  local uis = {}
  uis.SkillTips = GetBattle_SmallSkillTipsUis(ui:GetChild("SkillTips"))
  uis.root = ui
  return uis
end
