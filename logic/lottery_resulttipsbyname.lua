require("Lottery_ResultEffectByName")
require("Lottery_ResultOccupationByName")
require("Lottery_ResultTipsPicByName")
require("Lottery_NewByName")

function GetLottery_ResultTipsUis(ui)
  local uis = {}
  uis.Effect1 = GetLottery_ResultEffectUis(ui:GetChild("Effect1"))
  uis.Pic1Image = ui:GetChild("Pic1Image")
  uis.Occupation = GetLottery_ResultOccupationUis(ui:GetChild("Occupation"))
  uis.ResultTipsPic = GetLottery_ResultTipsPicUis(ui:GetChild("ResultTipsPic"))
  uis.Pic2Image = ui:GetChild("Pic2Image")
  uis.CardNameTxt = ui:GetChild("CardNameTxt")
  uis.New = GetLottery_NewUis(ui:GetChild("New"))
  uis.StarList = ui:GetChild("StarList")
  uis.Effect2 = GetLottery_ResultEffectUis(ui:GetChild("Effect2"))
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
