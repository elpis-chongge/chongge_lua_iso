require("CommonResource_PopupBgByName")
require("CommonResource_Popup_BByName")
require("Message_Code1ByName")

function GetMessage_Code2Uis(ui)
  local uis = {}
  uis.PopupBg = GetCommonResource_PopupBgUis(ui:GetChild("PopupBg"))
  uis.TouchScreenBtn = ui:GetChild("TouchScreenBtn")
  uis.Popup_B = GetCommonResource_Popup_BUis(ui:GetChild("Popup_B"))
  uis.Code1 = GetMessage_Code1Uis(ui:GetChild("Code1"))
  uis.root = ui
  return uis
end
