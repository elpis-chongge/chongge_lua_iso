require("CommonResource_PopupBgByName")
require("CommonResource_Popup_BByName")
require("Message_Rename1ByName")

function GetMessage_Rename2Uis(ui)
  local uis = {}
  uis.PopupBg = GetCommonResource_PopupBgUis(ui:GetChild("PopupBg"))
  uis.TouchScreenBtn = ui:GetChild("TouchScreenBtn")
  uis.Popup_B = GetCommonResource_Popup_BUis(ui:GetChild("Popup_B"))
  uis.Rename1 = GetMessage_Rename1Uis(ui:GetChild("Rename1"))
  uis.root = ui
  return uis
end
