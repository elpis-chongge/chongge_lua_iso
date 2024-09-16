require("CommonResource_PopupBgByName")
require("CommonResource_CardBreachByName")

function GetMessage_BreachTipsUis(ui)
  local uis = {}
  uis.PopupBg = GetCommonResource_PopupBgUis(ui:GetChild("PopupBg"))
  uis.TouchScreenBtn = ui:GetChild("TouchScreenBtn")
  uis.CardBreach = GetCommonResource_CardBreachUis(ui:GetChild("CardBreach"))
  uis.NumberTxt = ui:GetChild("NumberTxt")
  uis.BreachBtnList = ui:GetChild("BreachBtnList")
  uis.InfoList = ui:GetChild("InfoList")
  uis.root = ui
  return uis
end
