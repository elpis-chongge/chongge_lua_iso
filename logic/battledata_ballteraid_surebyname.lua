require("BattleData_BallteRaid_SureWordByName")

function GetBattleData_BallteRaid_SureUis(ui)
  local uis = {}
  uis.Word = GetBattleData_BallteRaid_SureWordUis(ui:GetChild("Word"))
  uis.root = ui
  return uis
end
