require("Message_GiftRewardMonthListByName")

function GetMessage_GiftRewardListUis(ui)
  local uis = {}
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.GiftRewardMonthList = GetMessage_GiftRewardMonthListUis(ui:GetChild("GiftRewardMonthList"))
  uis.ItemList = ui:GetChild("ItemList")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
