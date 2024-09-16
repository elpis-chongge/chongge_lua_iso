require("CommonResource_BackGroundByName")
require("Card_CardBListByName")
require("Card_CardAListByName")
require("Card_CardTypeChoiceByName")
require("Card_CardScreenByName")
require("CommonResource_CurrencyReturnByName")

function GetCard_CardListUis(ui)
  local uis = {}
  uis.BackGround = GetCommonResource_BackGroundUis(ui:GetChild("BackGround"))
  uis.CardB = GetCard_CardBListUis(ui:GetChild("CardB"))
  uis.CardA = GetCard_CardAListUis(ui:GetChild("CardA"))
  uis.CardTypeChoice = GetCard_CardTypeChoiceUis(ui:GetChild("CardTypeChoice"))
  uis.BadgeBtn = ui:GetChild("BadgeBtn")
  uis.DevelopBtn = ui:GetChild("DevelopBtn")
  uis.CardScreen = GetCard_CardScreenUis(ui:GetChild("CardScreen"))
  uis.CurrencyReturn = GetCommonResource_CurrencyReturnUis(ui:GetChild("CurrencyReturn"))
  uis.c1Ctr = ui:GetController("c1")
  uis.c2Ctr = ui:GetController("c2")
  uis.root = ui
  return uis
end
