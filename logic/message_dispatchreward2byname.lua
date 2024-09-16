require("CommonResource_PopupBgByName")
require("Message_Popup_BByName")
require("Message_DispatchReward1ByName")

function GetMessage_DispatchReward2Uis(ui)
  local uis = {}
  uis.PopupBg = GetCommonResource_PopupBgUis(ui:GetChild("PopupBg"))
  uis.TouchScreenBtn = ui:GetChild("TouchScreenBtn")
  uis.Popup_B = GetMessage_Popup_BUis(ui:GetChild("Popup_B"))
  uis.DispatchReward1 = GetMessage_DispatchReward1Uis(ui:GetChild("DispatchReward1"))
  uis.root = ui
  return uis
end
