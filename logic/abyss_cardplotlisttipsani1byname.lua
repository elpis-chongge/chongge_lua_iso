require("Abyss_CardPlotListTips1ByName")

function GetAbyss_CardPlotListTipsAni1Uis(ui)
  local uis = {}
  uis.CardPlotListTips = GetAbyss_CardPlotListTips1Uis(ui:GetChild("CardPlotListTips"))
  uis.root = ui
  return uis
end
