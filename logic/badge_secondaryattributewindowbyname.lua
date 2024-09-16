require("Badge_SecondaryAttributeByName")

function GetBadge_SecondaryAttributeWindowUis(ui)
  local uis = {}
  uis.Main = GetBadge_SecondaryAttributeUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
