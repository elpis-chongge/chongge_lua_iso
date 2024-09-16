require("CommonResource_PopupBgByName")
require("CommonResource_Popup_BByName")
require("Guild_Vote1ByName")

function GetGuild_Vote2Uis(ui)
  local uis = {}
  uis.PopupBg = GetCommonResource_PopupBgUis(ui:GetChild("PopupBg"))
  uis.TouchScreenBtn = ui:GetChild("TouchScreenBtn")
  uis.Popup_B = GetCommonResource_Popup_BUis(ui:GetChild("Popup_B"))
  uis.Vote1 = GetGuild_Vote1Uis(ui:GetChild("Vote1"))
  uis.root = ui
  return uis
end
