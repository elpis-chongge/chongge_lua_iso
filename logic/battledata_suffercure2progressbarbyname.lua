require("BattleData_SufferCure2ProgressFillByName")

function GetBattleData_SufferCure2ProgressBarUis(ui)
  local uis = {}
  uis.bar = GetBattleData_SufferCure2ProgressFillUis(ui:GetChild("bar"))
  uis.root = ui
  return uis
end
