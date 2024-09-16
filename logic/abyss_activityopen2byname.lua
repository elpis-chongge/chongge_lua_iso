require("CommonResource_PopupBgByName")
require("Abyss_ActivityOpenBgByName")
require("Abyss_ActivityOpen1ByName")

function GetAbyss_ActivityOpen2Uis(ui)
  local uis = {}
  uis.PopupBg = GetCommonResource_PopupBgUis(ui:GetChild("PopupBg"))
  uis.TouchScreenBtn = ui:GetChild("TouchScreenBtn")
  uis.ActivityOpenBg = GetAbyss_ActivityOpenBgUis(ui:GetChild("ActivityOpenBg"))
  uis.Currency1 = GetAbyss_ActivityOpen1Uis(ui:GetChild("Currency1"))
  uis.root = ui
  return uis
end
