require("SuperDungeon_PlayTitleByName")
require("SuperDungeon_PlayTargetByName")
require("SuperDungeon_PlayBuffByName")
require("SuperDungeon_PlayBossBuffByName")
require("SuperDungeon_PlaySuggest1ByName")
require("SuperDungeon_PlaySuggest2ByName")

function GetSuperDungeon_PlayTipsUis(ui)
  local uis = {}
  uis.Title = GetSuperDungeon_PlayTitleUis(ui:GetChild("Title"))
  uis.Target = GetSuperDungeon_PlayTargetUis(ui:GetChild("Target"))
  uis.Buff = GetSuperDungeon_PlayBuffUis(ui:GetChild("Buff"))
  uis.BossBuff = GetSuperDungeon_PlayBossBuffUis(ui:GetChild("BossBuff"))
  uis.CloseBtn = ui:GetChild("CloseBtn")
  uis.StartBtn = ui:GetChild("StartBtn")
  uis.PlaySuggest1 = GetSuperDungeon_PlaySuggest1Uis(ui:GetChild("PlaySuggest1"))
  uis.PlaySuggest2 = GetSuperDungeon_PlaySuggest2Uis(ui:GetChild("PlaySuggest2"))
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
