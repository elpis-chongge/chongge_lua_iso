require("Badge_BadgeScreen1ByName")

function GetBadge_BadgeScreen2Uis(ui)
  local uis = {}
  uis.TouchScreenBtn = ui:GetChild("TouchScreenBtn")
  uis.BadgeScreen1 = GetBadge_BadgeScreen1Uis(ui:GetChild("BadgeScreen1"))
  uis.root = ui
  return uis
end
