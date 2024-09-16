require("Badge_BadgeDecomposeByName")

function GetBadge_BadgeDecomposeWindowUis(ui)
  local uis = {}
  uis.Main = GetBadge_BadgeDecomposeUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
