require("CommonResource_PopupBgByName")
require("Badge_SecondaryAttributeTipsByName")

function GetBadge_SecondaryAttributeUis(ui)
  local uis = {}
  uis.PopupBg = GetCommonResource_PopupBgUis(ui:GetChild("PopupBg"))
  uis.TouchScreenBtn = ui:GetChild("TouchScreenBtn")
  uis.PrimaryAttributeTips = GetBadge_SecondaryAttributeTipsUis(ui:GetChild("PrimaryAttributeTips"))
  uis.root = ui
  return uis
end
