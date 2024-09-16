require("Badge_BadgeScreen2ByName")

function GetBadge_BadgeScreenWindowUis(ui)
  local uis = {}
  uis.Main = GetBadge_BadgeScreen2Uis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
