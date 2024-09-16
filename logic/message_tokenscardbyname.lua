require("Message_DiscountByName")
require("Message_TokensPrice2_1ByName")
require("Message_TokensPrice2_2ByName")
require("Message_BuyItemContentByName")
require("Message_NumberStrip1ByName")
require("Message_TokensBuyByName")

function GetMessage_TokensCardUis(ui)
  local uis = {}
  uis.Discount = GetMessage_DiscountUis(ui:GetChild("Discount"))
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.DemandList = ui:GetChild("DemandList")
  uis.PageList = ui:GetChild("PageList")
  uis.HeadList = ui:GetChild("HeadList")
  uis.Price1 = GetMessage_TokensPrice2_1Uis(ui:GetChild("Price1"))
  uis.Price2 = GetMessage_TokensPrice2_2Uis(ui:GetChild("Price2"))
  uis.BuyItemContent = GetMessage_BuyItemContentUis(ui:GetChild("BuyItemContent"))
  uis.NumberStrip = GetMessage_NumberStrip1Uis(ui:GetChild("NumberStrip"))
  uis.Buy = GetMessage_TokensBuyUis(ui:GetChild("Buy"))
  uis.saleCtr = ui:GetController("sale")
  uis.numberCtr = ui:GetController("number")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
