require("CommonResource_PopupBgByName")
require("Badge_ExchangeTipsByName")

function GetBadge_ExchangeUis(ui)
  local uis = {}
  uis.PopupBg = GetCommonResource_PopupBgUis(ui:GetChild("PopupBg"))
  uis.TouchScreenBtn = ui:GetChild("TouchScreenBtn")
  uis.PrimaryAttributeTips = GetBadge_ExchangeTipsUis(ui:GetChild("PrimaryAttributeTips"))
  uis.root = ui
  return uis
end
