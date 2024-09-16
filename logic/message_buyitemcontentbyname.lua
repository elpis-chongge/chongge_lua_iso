require("Message_BuyItemByName")

function GetMessage_BuyItemContentUis(ui)
  local uis = {}
  uis.NumberTxt = ui:GetChild("NumberTxt")
  uis.Item = GetMessage_BuyItemUis(ui:GetChild("Item"))
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
