require("CommonResource_PopupBgByName")
require("CommonResource_Popup_BByName")
require("Chat_Complaint1ByName")

function GetChat_Complaint2Uis(ui)
  local uis = {}
  uis.PopupBg = GetCommonResource_PopupBgUis(ui:GetChild("PopupBg"))
  uis.TouchScreenBtn = ui:GetChild("TouchScreenBtn")
  uis.Popup_B = GetCommonResource_Popup_BUis(ui:GetChild("Popup_B"))
  uis.Complaint1 = GetChat_Complaint1Uis(ui:GetChild("Complaint1"))
  uis.root = ui
  return uis
end
