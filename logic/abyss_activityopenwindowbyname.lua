require("Abyss_ActivityOpen2ByName")

function GetAbyss_ActivityOpenWindowUis(ui)
  local uis = {}
  uis.Main = GetAbyss_ActivityOpen2Uis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
