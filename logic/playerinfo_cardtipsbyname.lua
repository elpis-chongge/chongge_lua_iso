require("PlayerInfo_Quality1_1ByName")
require("PlayerInfo_CardPicByName")
require("PlayerInfo_Quality1_2ByName")
require("CommonResource_OccupationByName")
require("CommonResource_CardBreachByName")

function GetPlayerInfo_CardTipsUis(ui)
  local uis = {}
  uis.Quality1_1 = GetPlayerInfo_Quality1_1Uis(ui:GetChild("Quality1_1"))
  uis.CardPic = GetPlayerInfo_CardPicUis(ui:GetChild("CardPic"))
  uis.Quality1_2 = GetPlayerInfo_Quality1_2Uis(ui:GetChild("Quality1_2"))
  uis.Occupation = GetCommonResource_OccupationUis(ui:GetChild("Occupation"))
  uis.ElementList = ui:GetChild("ElementList")
  uis.StarList = ui:GetChild("StarList")
  uis.CardNameTxt = ui:GetChild("CardNameTxt")
  uis.CardLvTxt = ui:GetChild("CardLvTxt")
  uis.CardBreach = GetCommonResource_CardBreachUis(ui:GetChild("CardBreach"))
  uis.root = ui
  return uis
end
