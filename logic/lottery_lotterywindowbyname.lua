require("Lottery_LotteryByName")

function GetLottery_LotteryWindowUis(ui)
  local uis = {}
  uis.Main = GetLottery_LotteryUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
