require("Abyss_CardPlotMainByName")

function GetAbyss_CardPlotMainWindowUis(ui)
  local uis = {}
  uis.Main = GetAbyss_CardPlotMainUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
