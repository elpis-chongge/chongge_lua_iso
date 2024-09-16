require("Lottery_ExchangeTipsByName")

function GetLottery_E_TipsUis(ui)
  local uis = {}
  uis.ResultTips = GetLottery_ExchangeTipsUis(ui:GetChild("ResultTips"))
  uis.TpBtn = ui:GetChild("TpBtn")
  uis.root = ui
  return uis
end
