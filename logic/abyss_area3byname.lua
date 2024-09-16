require("Abyss_AreaTitleByName")

function GetAbyss_Area3Uis(ui)
  local uis = {}
  uis.AreaTitle = GetAbyss_AreaTitleUis(ui:GetChild("AreaTitle"))
  uis.root = ui
  return uis
end
