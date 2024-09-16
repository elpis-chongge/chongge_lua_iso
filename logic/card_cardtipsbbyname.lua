require("Card_Quality1_1ByName")
require("Card_CardPicBByName")
require("Card_Quality1_2ByName")
require("CommonResource_OccupationByName")
require("CommonResource_CardBreachByName")
require("CommonResource_RedDotByName")
require("CommonResource_StarRedDotByName")
require("CommonResource_CardGetNewByName")

function GetCard_CardTipsBUis(ui)
  local uis = {}
  uis.Quality1_1 = GetCard_Quality1_1Uis(ui:GetChild("Quality1_1"))
  uis.CardPic = GetCard_CardPicBUis(ui:GetChild("CardPic"))
  uis.Quality1_2 = GetCard_Quality1_2Uis(ui:GetChild("Quality1_2"))
  uis.Occupation = GetCommonResource_OccupationUis(ui:GetChild("Occupation"))
  uis.ElementList = ui:GetChild("ElementList")
  uis.StarList = ui:GetChild("StarList")
  uis.CardNameTxt = ui:GetChild("CardNameTxt")
  uis.CardLvTxt = ui:GetChild("CardLvTxt")
  uis.CardBreach = GetCommonResource_CardBreachUis(ui:GetChild("CardBreach"))
  uis.Red = GetCommonResource_RedDotUis(ui:GetChild("Red"))
  uis.StarRedDot = GetCommonResource_StarRedDotUis(ui:GetChild("StarRedDot"))
  uis.New = GetCommonResource_CardGetNewUis(ui:GetChild("New"))
  uis.FlagCtr = ui:GetController("Flag")
  uis.root = ui
  return uis
end
