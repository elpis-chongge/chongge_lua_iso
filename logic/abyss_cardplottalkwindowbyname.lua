require("Abyss_CardPlotTalkByName")

function GetAbyss_CardPlotTalkWindowUis(ui)
  local uis = {}
  uis.Main = GetAbyss_CardPlotTalkUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
