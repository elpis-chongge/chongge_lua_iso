require("CommonResource_PopupBgByName")
require("CommonResource_Popup_BByName")
require("RogueBuild01_GiveUp1ByName")

function GetRogueBuild01_GiveUp2Uis(ui)
  local uis = {}
  uis.PopupBg = GetCommonResource_PopupBgUis(ui:GetChild("PopupBg"))
  uis.TouchScreenBtn = ui:GetChild("TouchScreenBtn")
  uis.Popup_B = GetCommonResource_Popup_BUis(ui:GetChild("Popup_B"))
  uis.Currency1 = GetRogueBuild01_GiveUp1Uis(ui:GetChild("Currency1"))
  uis.root = ui
  return uis
end
