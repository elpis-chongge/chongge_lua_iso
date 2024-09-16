require("Abyss_DetailsTipsTitleAniByName")

function GetAbyss_CardPlotDetailsUis(ui)
  local uis = {}
  uis.TipsList = ui:GetChild("TipsList")
  uis.DetailsTipsTitleAni = GetAbyss_DetailsTipsTitleAniUis(ui:GetChild("DetailsTipsTitleAni"))
  uis.root = ui
  return uis
end
