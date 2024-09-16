require("Lottery_P_CardInfo1ByName")

function GetLottery_R_TipsUis(ui)
  local uis = {}
  uis.P_CardInfo1 = GetLottery_P_CardInfo1Uis(ui:GetChild("P_CardInfo1"))
  uis.root = ui
  return uis
end
