require("RaidBoss_DifficultyDotByName")
require("RaidBoss_DifficultyDot1ByName")

function GetRaidBoss_DifficultyDotRegionUis(ui)
  local uis = {}
  uis.Dot = GetRaidBoss_DifficultyDotUis(ui:GetChild("Dot"))
  uis.Dot1 = GetRaidBoss_DifficultyDot1Uis(ui:GetChild("Dot1"))
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
