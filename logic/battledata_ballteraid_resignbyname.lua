require("BattleData_BallteRaid_ResignWordByName")

function GetBattleData_BallteRaid_ResignUis(ui)
  local uis = {}
  uis.Word = GetBattleData_BallteRaid_ResignWordUis(ui:GetChild("Word"))
  uis.root = ui
  return uis
end
