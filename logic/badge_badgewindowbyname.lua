require("Badge_BadgeByName")

function GetBadge_BadgeWindowUis(ui)
  local uis = {}
  uis.Main = GetBadge_BadgeUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
