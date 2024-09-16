require("CommonResource_PopupBgByName")
require("Expedition_BuffTipsBgByName")

function GetExpedition_BuffTipsUis(ui)
  local uis = {}
  uis.PopupBg = GetCommonResource_PopupBgUis(ui:GetChild("PopupBg"))
  uis.TouchScreenBtn = ui:GetChild("TouchScreenBtn")
  uis.BuffTipsBg = GetExpedition_BuffTipsBgUis(ui:GetChild("BuffTipsBg"))
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.root = ui
  return uis
end
