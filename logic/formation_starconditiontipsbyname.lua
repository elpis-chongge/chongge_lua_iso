require("CommonResource_PopupBgByName")
require("Formation_StarConditionBgByName")
require("Formation_StarConditionTitleByName")

function GetFormation_StarConditionTipsUis(ui)
  local uis = {}
  uis.PopupBg = GetCommonResource_PopupBgUis(ui:GetChild("PopupBg"))
  uis.TouchScreenBtn = ui:GetChild("TouchScreenBtn")
  uis.StarConditionBg = GetFormation_StarConditionBgUis(ui:GetChild("StarConditionBg"))
  uis.Title = GetFormation_StarConditionTitleUis(ui:GetChild("Title"))
  uis.TipsList = ui:GetChild("TipsList")
  uis.root = ui
  return uis
end
