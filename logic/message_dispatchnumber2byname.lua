require("CommonResource_PopupBgByName")
require("CommonResource_Popup_BByName")
require("Message_DispatchNumber1ByName")

function GetMessage_DispatchNumber2Uis(ui)
  local uis = {}
  uis.PopupBg = GetCommonResource_PopupBgUis(ui:GetChild("PopupBg"))
  uis.TouchScreenBtn = ui:GetChild("TouchScreenBtn")
  uis.Popup_B = GetCommonResource_Popup_BUis(ui:GetChild("Popup_B"))
  uis.DispatchNumber1 = GetMessage_DispatchNumber1Uis(ui:GetChild("DispatchNumber1"))
  uis.root = ui
  return uis
end
