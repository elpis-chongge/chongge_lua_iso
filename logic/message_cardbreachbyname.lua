require("CommonResource_CardBreachByName")

function GetMessage_CardBreachUis(ui)
  local uis = {}
  uis.CardBreach1 = GetCommonResource_CardBreachUis(ui:GetChild("CardBreach1"))
  uis.CardBreach2 = GetCommonResource_CardBreachUis(ui:GetChild("CardBreach2"))
  uis.root = ui
  return uis
end
