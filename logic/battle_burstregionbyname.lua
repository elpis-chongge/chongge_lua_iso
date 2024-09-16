require("Battle_TacticalSkillRegionByName")

function GetBattle_BurstRegionUis(ui)
  local uis = {}
  uis.CardHeadList = ui:GetChild("CardHeadList")
  uis.BurstBtn = ui:GetChild("BurstBtn")
  uis.TacticalSkillRegion = GetBattle_TacticalSkillRegionUis(ui:GetChild("TacticalSkillRegion"))
  uis.BurstCtr = ui:GetController("Burst")
  uis.GuildBossCtr = ui:GetController("GuildBoss")
  uis.root = ui
  return uis
end
