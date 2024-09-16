require("CommonResource_PopupBgByName")
require("Abyss_MobTipsByName")

function GetAbyss_MobUis(ui)
  local uis = {}
  uis.PopupBg = GetCommonResource_PopupBgUis(ui:GetChild("PopupBg"))
  uis.TouchScreenBtn = ui:GetChild("TouchScreenBtn")
  uis.MobTips = GetAbyss_MobTipsUis(ui:GetChild("MobTips"))
  uis.root = ui
  return uis
end
