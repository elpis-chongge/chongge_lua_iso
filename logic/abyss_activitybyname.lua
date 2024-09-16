require("CommonResource_PopupBgByName")
require("Abyss_ActivityTipsByName")

function GetAbyss_ActivityUis(ui)
  local uis = {}
  uis.PopupBg = GetCommonResource_PopupBgUis(ui:GetChild("PopupBg"))
  uis.TouchScreenBtn = ui:GetChild("TouchScreenBtn")
  uis.ActivityTips = GetAbyss_ActivityTipsUis(ui:GetChild("ActivityTips"))
  uis.root = ui
  return uis
end
