require("CommonResource_PopupBgByName")
require("CommonResource_Popup_OpalByName")
require("Message_MainOpalExchange1ByName")

function GetMessage_MainOpalExchange2Uis(ui)
  local uis = {}
  uis.PopupBg = GetCommonResource_PopupBgUis(ui:GetChild("PopupBg"))
  uis.TouchScreenBtn = ui:GetChild("TouchScreenBtn")
  uis.Popup_Opal = GetCommonResource_Popup_OpalUis(ui:GetChild("Popup_Opal"))
  uis.MainOpalExchange1 = GetMessage_MainOpalExchange1Uis(ui:GetChild("MainOpalExchange1"))
  uis.root = ui
  return uis
end
