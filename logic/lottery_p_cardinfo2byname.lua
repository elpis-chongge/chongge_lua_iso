require("Lottery_P_CardInfo1ByName")

function GetLottery_P_CardInfo2Uis(ui)
  local uis = {}
  uis.P_CardInfo1 = GetLottery_P_CardInfo1Uis(ui:GetChild("P_CardInfo1"))
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
