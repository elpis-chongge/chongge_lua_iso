require("Abyss_AreaTitleByName")

function GetAbyss_Area1Uis(ui)
  local uis = {}
  uis.AreaTitle = GetAbyss_AreaTitleUis(ui:GetChild("AreaTitle"))
  uis.lockCtr = ui:GetController("lock")
  uis.root = ui
  return uis
end
