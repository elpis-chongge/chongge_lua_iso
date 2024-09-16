require("RaidBossTips_RageSkillWordByName")

function GetRaidBossTips_RageSkillTipsUis(ui)
  local uis = {}
  uis.killWord1 = GetRaidBossTips_RageSkillWordUis(ui:GetChild("killWord1"))
  uis.killWord2 = GetRaidBossTips_RageSkillWordUis(ui:GetChild("killWord2"))
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
