require("Lottery_ExchangeByName")

function GetLottery_ExchangeWindowUis(ui)
  local uis = {}
  uis.Main = GetLottery_ExchangeUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
