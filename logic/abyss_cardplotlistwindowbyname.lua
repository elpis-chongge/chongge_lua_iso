require("Abyss_CardPlotListByName")

function GetAbyss_CardPlotListWindowUis(ui)
  local uis = {}
  uis.Main = GetAbyss_CardPlotListUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
