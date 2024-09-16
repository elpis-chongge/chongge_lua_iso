require("RaidBoss_DifficultyDotByName")
require("RaidBoss_BossHPInfiniteByName")

function GetRaidBoss_BossHPInfoUis(ui)
  local uis = {}
  uis.HPProgressBar = ui:GetChild("HPProgressBar")
  uis.DifficultyDot = GetRaidBoss_DifficultyDotUis(ui:GetChild("DifficultyDot"))
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.NumberTxt = ui:GetChild("NumberTxt")
  uis.Infinite = GetRaidBoss_BossHPInfiniteUis(ui:GetChild("Infinite"))
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
