require("Abyss_CardPlotDetailsByName")

function GetAbyss_CardPlotDetailsWindowUis(ui)
  local uis = {}
  uis.Main = GetAbyss_CardPlotDetailsUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
