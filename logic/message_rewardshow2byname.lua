require("CommonResource_PopupBgByName")
require("CommonResource_Popup_BByName")
require("Message_RewardShow1ByName")

function GetMessage_RewardShow2Uis(ui)
  local uis = {}
  uis.PopupBg = GetCommonResource_PopupBgUis(ui:GetChild("PopupBg"))
  uis.TouchScreenBtn = ui:GetChild("TouchScreenBtn")
  uis.Popup_B = GetCommonResource_Popup_BUis(ui:GetChild("Popup_B"))
  uis.RewardShow1 = GetMessage_RewardShow1Uis(ui:GetChild("RewardShow1"))
  uis.root = ui
  return uis
end
