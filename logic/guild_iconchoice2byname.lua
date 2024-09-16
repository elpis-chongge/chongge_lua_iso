require("CommonResource_PopupBgByName")
require("CommonResource_Popup_BByName")
require("Guild_IconChoice1ByName")

function GetGuild_IconChoice2Uis(ui)
  local uis = {}
  uis.PopupBg = GetCommonResource_PopupBgUis(ui:GetChild("PopupBg"))
  uis.TouchScreenBtn = ui:GetChild("TouchScreenBtn")
  uis.Popup_B = GetCommonResource_Popup_BUis(ui:GetChild("Popup_B"))
  uis.IconChoice1 = GetGuild_IconChoice1Uis(ui:GetChild("IconChoice1"))
  uis.root = ui
  return uis
end
