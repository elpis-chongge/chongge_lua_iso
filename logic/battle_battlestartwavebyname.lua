require("Battle_BattleStartWaveBgByName")

function GetBattle_BattleStartWaveUis(ui)
  local uis = {}
  uis.BattleStartWaveBg = GetBattle_BattleStartWaveBgUis(ui:GetChild("BattleStartWaveBg"))
  uis.WaveTxt = ui:GetChild("WaveTxt")
  uis.root = ui
  return uis
end
