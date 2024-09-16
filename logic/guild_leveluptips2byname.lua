require("CommonResource_PopupBgByName")
require("Guild_Popup_S1ByName")
require("Guild_LevelUpTips1ByName")

function GetGuild_LevelUpTips2Uis(ui)
  local uis = {}
  uis.PopupBg = GetCommonResource_PopupBgUis(ui:GetChild("PopupBg"))
  uis.TouchScreenBtn = ui:GetChild("TouchScreenBtn")
  uis.Popup_S = GetGuild_Popup_S1Uis(ui:GetChild("Popup_S"))
  uis.LevelUpTips1 = GetGuild_LevelUpTips1Uis(ui:GetChild("LevelUpTips1"))
  uis.root = ui
  return uis
end
