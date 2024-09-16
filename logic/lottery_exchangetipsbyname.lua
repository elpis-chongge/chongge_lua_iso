require("Lottery_ExchangeTipsPicByName")
require("Lottery_ExchangeQualityByName")
require("Lottery_NewByName")
require("CommonResource_OccupationByName")

function GetLottery_ExchangeTipsUis(ui)
  local uis = {}
  uis.ResultTipsPic = GetLottery_ExchangeTipsPicUis(ui:GetChild("ResultTipsPic"))
  uis.Quality = GetLottery_ExchangeQualityUis(ui:GetChild("Quality"))
  uis.CardNameTxt = ui:GetChild("CardNameTxt")
  uis.New = GetLottery_NewUis(ui:GetChild("New"))
  uis.Occupation = GetCommonResource_OccupationUis(ui:GetChild("Occupation"))
  uis.ElementList = ui:GetChild("ElementList")
  uis.StarList = ui:GetChild("StarList")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
