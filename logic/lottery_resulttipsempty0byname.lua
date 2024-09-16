require("Lottery_ResultTipsEmpty1ByName")

function GetLottery_ResultTipsEmpty0Uis(ui)
  local uis = {}
  uis.ResultTipsEmpty1 = GetLottery_ResultTipsEmpty1Uis(ui:GetChild("ResultTipsEmpty1"))
  uis.root = ui
  return uis
end
