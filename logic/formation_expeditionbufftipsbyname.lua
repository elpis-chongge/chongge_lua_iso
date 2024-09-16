require("CommonResource_PopupBgByName")
require("Formation_ExpeditionBuffTipsBgByName")

function GetFormation_ExpeditionBuffTipsUis(ui)
  local uis = {}
  uis.PopupBg = GetCommonResource_PopupBgUis(ui:GetChild("PopupBg"))
  uis.TouchScreenBtn = ui:GetChild("TouchScreenBtn")
  uis.BuffTipsBg = GetFormation_ExpeditionBuffTipsBgUis(ui:GetChild("BuffTipsBg"))
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.root = ui
  return uis
end
