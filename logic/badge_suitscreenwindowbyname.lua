require("Badge_SuitScreenByName")

function GetBadge_SuitScreenWindowUis(ui)
  local uis = {}
  uis.Main = GetBadge_SuitScreenUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
