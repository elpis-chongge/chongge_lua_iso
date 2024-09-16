require("Lottery_ResultTipsEmpty2ByName")

function GetLottery_ResultTipsEmpty1Uis(ui)
  local uis = {}
  uis.ResultTipsEmpty2 = GetLottery_ResultTipsEmpty2Uis(ui:GetChild("ResultTipsEmpty2"))
  uis.root = ui
  return uis
end
