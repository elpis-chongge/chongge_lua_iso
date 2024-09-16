require("Message_GiftBuyPrice1ByName")
require("Message_GiftBuyPrice2ByName")
require("Message_GiftBuyPrice3ByName")

function GetMessage_GiftBuyPriceUis(ui)
  local uis = {}
  uis.GiftBuyPrice1 = GetMessage_GiftBuyPrice1Uis(ui:GetChild("GiftBuyPrice1"))
  uis.GiftBuyPrice2 = GetMessage_GiftBuyPrice2Uis(ui:GetChild("GiftBuyPrice2"))
  uis.GiftBuyPrice3 = GetMessage_GiftBuyPrice3Uis(ui:GetChild("GiftBuyPrice3"))
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
