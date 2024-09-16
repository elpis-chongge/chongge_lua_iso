require("Message_GiftDemandItemByName")

function GetMessage_GiftRewardMonthListUis(ui)
  local uis = {}
  uis.OnceItem = GetMessage_GiftDemandItemUis(ui:GetChild("OnceItem"))
  uis.ItemList = ui:GetChild("ItemList")
  uis.root = ui
  return uis
end
