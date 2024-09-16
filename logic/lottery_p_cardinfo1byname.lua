require("Lottery_Quality1_1ByName")
require("Lottery_P_CardInfoPicByName")
require("Lottery_Quality1_2ByName")
require("CommonResource_OccupationByName")

function GetLottery_P_CardInfo1Uis(ui)
  local uis = {}
  uis.Quality1_1 = GetLottery_Quality1_1Uis(ui:GetChild("Quality1_1"))
  uis.CardPic = GetLottery_P_CardInfoPicUis(ui:GetChild("CardPic"))
  uis.Quality1_2 = GetLottery_Quality1_2Uis(ui:GetChild("Quality1_2"))
  uis.Occupation = GetCommonResource_OccupationUis(ui:GetChild("Occupation"))
  uis.ElementList = ui:GetChild("ElementList")
  uis.StarList = ui:GetChild("StarList")
  uis.CardNameTxt = ui:GetChild("CardNameTxt")
  uis.root = ui
  return uis
end
