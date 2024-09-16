require("CommonResource_CardBreachByName")

function GetMessage_CardBreachBtnUis(ui)
  local uis = {}
  uis.CardBreach = GetCommonResource_CardBreachUis(ui:GetChild("CardBreach"))
  uis.buttonCtr = ui:GetController("button")
  uis.root = ui
  return uis
end
