require("CommonResource_PopupBgByName")
require("Badge_PrimaryAttributeTipsByName")

function GetBadge_PrimaryAttributeUis(ui)
  local uis = {}
  uis.PopupBg = GetCommonResource_PopupBgUis(ui:GetChild("PopupBg"))
  uis.TouchScreenBtn = ui:GetChild("TouchScreenBtn")
  uis.PrimaryAttributeTips = GetBadge_PrimaryAttributeTipsUis(ui:GetChild("PrimaryAttributeTips"))
  uis.root = ui
  return uis
end
