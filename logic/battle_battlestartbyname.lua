require("Battle_BattleStartBgByName")
require("Battle_BattleStartWaveByName")

function GetBattle_BattleStartUis(ui)
  local uis = {}
  uis.BattleStartBg = GetBattle_BattleStartBgUis(ui:GetChild("BattleStartBg"))
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.SubtitleTxt = ui:GetChild("SubtitleTxt")
  uis.BattleStartWave = GetBattle_BattleStartWaveUis(ui:GetChild("BattleStartWave"))
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
