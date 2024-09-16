require("CommonResource_PopupBgByName")
require("CommonResource_Popup_OpalByName")
require("Message_OpalExchange1ByName")

function GetMessage_OpalExchange2Uis(ui)
  local uis = {}
  uis.PopupBg = GetCommonResource_PopupBgUis(ui:GetChild("PopupBg"))
  uis.TouchScreenBtn = ui:GetChild("TouchScreenBtn")
  uis.Popup_Opal = GetCommonResource_Popup_OpalUis(ui:GetChild("Popup_Opal"))
  uis.Rename1 = GetMessage_OpalExchange1Uis(ui:GetChild("Rename1"))
  uis.root = ui
  return uis
end
