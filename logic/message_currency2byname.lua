require("CommonResource_PopupBgByName")
require("CommonResource_Popup_BByName")
require("Message_Currency1ByName")

function GetMessage_Currency2Uis(ui)
  local uis = {}
  uis.PopupBg = GetCommonResource_PopupBgUis(ui:GetChild("PopupBg"))
  uis.TouchScreenBtn = ui:GetChild("TouchScreenBtn")
  uis.Popup_B = GetCommonResource_Popup_BUis(ui:GetChild("Popup_B"))
  uis.Currency1 = GetMessage_Currency1Uis(ui:GetChild("Currency1"))
  uis.root = ui
  return uis
end
