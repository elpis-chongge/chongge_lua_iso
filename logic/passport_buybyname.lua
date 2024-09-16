require("CommonResource_PopupBgByName")

function GetPassport_BuyUis(ui)
  local uis = {}
  uis.PopupBg = GetCommonResource_PopupBgUis(ui:GetChild("PopupBg"))
  uis.TouchScreenBtn = ui:GetChild("TouchScreenBtn")
  uis.PriceTxt = ui:GetChild("PriceTxt")
  uis.BuyItemBtn = ui:GetChild("BuyItemBtn")
  uis.root = ui
  return uis
end
