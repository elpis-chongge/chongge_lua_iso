require("Message_GiftNameByName")
require("Message_GiftWordContentByName")
require("Message_GiftBuyPriceByName")
require("Message_LackWordByName")
require("Message_GiftRewardListByName")

function GetMessage_GiftTips1Uis(ui)
  local uis = {}
  uis.GiftName = GetMessage_GiftNameUis(ui:GetChild("GiftName"))
  uis.GiftWordContent = GetMessage_GiftWordContentUis(ui:GetChild("GiftWordContent"))
  uis.GiftBuyPrice = GetMessage_GiftBuyPriceUis(ui:GetChild("GiftBuyPrice"))
  uis.SureBtn = ui:GetChild("SureBtn")
  uis.LackWord = GetMessage_LackWordUis(ui:GetChild("LackWord"))
  uis.GiftRewardList = GetMessage_GiftRewardListUis(ui:GetChild("GiftRewardList"))
  uis.c1Ctr = ui:GetController("c1")
  uis.c2Ctr = ui:GetController("c2")
  uis.c3Ctr = ui:GetController("c3")
  uis.root = ui
  return uis
end
