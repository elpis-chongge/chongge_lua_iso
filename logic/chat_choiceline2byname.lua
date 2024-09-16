require("CommonResource_PopupBgByName")
require("CommonResource_Popup_BByName")
require("Chat_ChoiceLine1ByName")

function GetChat_ChoiceLine2Uis(ui)
  local uis = {}
  uis.PopupBg = GetCommonResource_PopupBgUis(ui:GetChild("PopupBg"))
  uis.TouchScreenBtn = ui:GetChild("TouchScreenBtn")
  uis.Popup_B = GetCommonResource_Popup_BUis(ui:GetChild("Popup_B"))
  uis.ChoiceLine1 = GetChat_ChoiceLine1Uis(ui:GetChild("ChoiceLine1"))
  uis.root = ui
  return uis
end
