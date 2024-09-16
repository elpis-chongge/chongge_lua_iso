require("Abyss_CardPlotStartByName")

function GetAbyss_CardPlotStartWindowUis(ui)
  local uis = {}
  uis.Main = GetAbyss_CardPlotStartUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
