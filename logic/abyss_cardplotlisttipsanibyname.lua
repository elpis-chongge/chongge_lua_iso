require("Abyss_CardPlotListTipsByName")

function GetAbyss_CardPlotListTipsAniUis(ui)
  local uis = {}
  uis.CardPlotListTips = GetAbyss_CardPlotListTipsUis(ui:GetChild("CardPlotListTips"))
  uis.root = ui
  return uis
end
