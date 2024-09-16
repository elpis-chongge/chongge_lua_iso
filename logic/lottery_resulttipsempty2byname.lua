require("Lottery_ResultTipsByName")

function GetLottery_ResultTipsEmpty2Uis(ui)
  local uis = {}
  uis.ResultTips = GetLottery_ResultTipsUis(ui:GetChild("ResultTips"))
  uis.root = ui
  return uis
end
