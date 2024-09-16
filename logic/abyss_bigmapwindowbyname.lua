require("Abyss_BigMapByName")

function GetAbyss_BigMapWindowUis(ui)
  local uis = {}
  uis.Main = GetAbyss_BigMapUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
