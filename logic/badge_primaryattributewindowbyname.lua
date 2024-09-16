require("Badge_PrimaryAttributeByName")

function GetBadge_PrimaryAttributeWindowUis(ui)
  local uis = {}
  uis.Main = GetBadge_PrimaryAttributeUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
