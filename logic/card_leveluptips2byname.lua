require("CommonResource_PopupBgByName")
require("CommonResource_Popup_SByName")
require("Card_LevelUpTips1ByName")

function GetCard_LevelUpTips2Uis(ui)
  local uis = {}
  uis.PopupBg = GetCommonResource_PopupBgUis(ui:GetChild("PopupBg"))
  uis.TouchScreenBtn = ui:GetChild("TouchScreenBtn")
  uis.Popup_S = GetCommonResource_Popup_SUis(ui:GetChild("Popup_S"))
  uis.LevelUpTips1 = GetCard_LevelUpTips1Uis(ui:GetChild("LevelUpTips1"))
  uis.root = ui
  return uis
end
