require("Battle_BossHeadByName")
require("Battle_BossNameByName")
require("Battle_BossBattleTipsInfo1ByName")

function GetBattle_BossBattleTipsUis(ui)
  local uis = {}
  uis.BossBattleTips = GetBattle_BossHeadUis(ui:GetChild("BossBattleTips"))
  uis.BossName = GetBattle_BossNameUis(ui:GetChild("BossName"))
  uis.HpBossBigProgressBar = ui:GetChild("HpBossBigProgressBar")
  uis.DefenseBossBigProgressBar = ui:GetChild("DefenseBossBigProgressBar")
  uis.RageBossProgressBar = ui:GetChild("RageBossProgressBar")
  uis.FirmProgressBar = ui:GetChild("FirmProgressBar")
  uis.ElementList = ui:GetChild("ElementList")
  uis.BuffIconList = ui:GetChild("BuffIconList")
  uis.Info1 = GetBattle_BossBattleTipsInfo1Uis(ui:GetChild("Info1"))
  uis.c1Ctr = ui:GetController("c1")
  uis.HpVolumeCtr = ui:GetController("HpVolume")
  uis.root = ui
  return uis
end
