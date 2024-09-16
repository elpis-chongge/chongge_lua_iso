require("Card_CardPicAByName")
require("Card_QualityByName")
require("CommonResource_CardBreachByName")
require("CommonResource_OccupationByName")
require("CommonResource_RedDotByName")
require("CommonResource_CardGetNewByName")
require("CommonResource_StarRedDot1ByName")

function GetCard_CardTipsAUis(ui)
  local uis = {}
  uis.CardPic = GetCard_CardPicAUis(ui:GetChild("CardPic"))
  uis.Quality = GetCard_QualityUis(ui:GetChild("Quality"))
  uis.StarList = ui:GetChild("StarList")
  uis.CardBreach = GetCommonResource_CardBreachUis(ui:GetChild("CardBreach"))
  uis.CardLvTxt = ui:GetChild("CardLvTxt")
  uis.CardNameTxt = ui:GetChild("CardNameTxt")
  uis.Occupation = GetCommonResource_OccupationUis(ui:GetChild("Occupation"))
  uis.ElementList = ui:GetChild("ElementList")
  uis.Red = GetCommonResource_RedDotUis(ui:GetChild("Red"))
  uis.New = GetCommonResource_CardGetNewUis(ui:GetChild("New"))
  uis.StarRedDot = GetCommonResource_StarRedDot1Uis(ui:GetChild("StarRedDot"))
  uis.FlagCtr = ui:GetController("Flag")
  uis.root = ui
  return uis
end
